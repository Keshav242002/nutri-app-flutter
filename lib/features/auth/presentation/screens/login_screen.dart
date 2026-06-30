import 'package:ahara/core/providers/toast_provider.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_radius.dart';
import 'package:ahara/core/theme/app_shadows.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/app_button.dart';
import 'package:ahara/core/widgets/app_text_field.dart';
import 'package:ahara/core/widgets/loading_state.dart';
import 'package:ahara/features/auth/domain/models/login_form_state.dart';
import 'package:ahara/features/auth/domain/models/user_model.dart';
import 'package:ahara/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Combined login + signup screen.
///
/// States inside the bottom sheet:
/// A — choose method (Google / Email)
/// B — email + password entry
class LoginScreen extends ConsumerStatefulWidget {
  /// Creates the [LoginScreen].
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _forgotEmailCtrl = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _forgotPasswordFocusNode = FocusNode();
  bool _obscurePassword = true;
  bool _isForgotSubmitting = false;
  // Used only for PopScope.canPop — not for layout, to avoid rebuild loops.
  bool _anyFieldFocused = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_onFocusChanged);
    _passwordFocusNode.addListener(_onFocusChanged);
    _forgotPasswordFocusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    final focused = _emailFocusNode.hasFocus ||
        _passwordFocusNode.hasFocus ||
        _forgotPasswordFocusNode.hasFocus;
    if (focused != _anyFieldFocused) {
      setState(() => _anyFieldFocused = focused);
    }
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_onFocusChanged);
    _passwordFocusNode.removeListener(_onFocusChanged);
    _forgotPasswordFocusNode.removeListener(_onFocusChanged);
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _forgotEmailCtrl.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _forgotPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onStateChanged(LoginFormState? prev, LoginFormState next) {
    next.maybeWhen(
      success: (User __) => context.go(RoutePaths.home),
      error: (String msg) {
        ref.read(toastProvider.notifier).show(msg);
        ref.read(loginControllerProvider.notifier).goBack();
      },
      chooseMethod: () {
        // Dismiss keyboard when going back to choose-method state.
        FocusManager.instance.primaryFocus?.unfocus();
      },
      emailPasswordEntry: (
        String email,
        String password,
        _,
        String? errorMessage,
      ) {
        if (errorMessage != null) {
          ref.read(toastProvider.notifier).show(errorMessage);
          ref.read(loginControllerProvider.notifier).clearEmailPasswordError();
        }
        // Sync controllers here (state transition), not inside build.
        if (_emailCtrl.text != email) _emailCtrl.text = email;
        if (_passwordCtrl.text != password) _passwordCtrl.text = password;

        final wasChooseMethod = prev?.maybeWhen(
          chooseMethod: () => true,
          orElse: () => false,
        ) ?? false;
        if (wasChooseMethod) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _emailFocusNode.requestFocus();
          });
        }
      },
      forgotPasswordEntry: (String email, String? errorMessage) {
        if (_isForgotSubmitting) {
          setState(() => _isForgotSubmitting = false);
        }
        if (_forgotEmailCtrl.text != email) _forgotEmailCtrl.text = email;
        if (errorMessage != null) {
          ref.read(toastProvider.notifier).show(errorMessage);
        }
      },
      forgotPasswordSent: (String email) {
        if (_isForgotSubmitting) {
          setState(() => _isForgotSubmitting = false);
        }
        ref.read(toastProvider.notifier).show(
          'Reset link sent to $email — check your inbox and spam folder.',
          type: ToastType.success,
        );
        ref.read(loginControllerProvider.notifier).goBack();
      },
      orElse: () {},
    );
  }

  Future<void> _submitForgotPassword(String email) async {
    if (_isForgotSubmitting) return;
    setState(() => _isForgotSubmitting = true);
    await ref
        .read(loginControllerProvider.notifier)
        .submitForgotPassword(email);
    if (mounted) setState(() => _isForgotSubmitting = false);
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch<LoginFormState>(loginControllerProvider);
    ref.listen<LoginFormState>(loginControllerProvider, _onStateChanged);

    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    final safeBottom = padding.bottom;
    final statusBarHeight = padding.top;
    // Read keyboard height for a continuous shrink formula — safe because it
    // drives a proportional height change (not a boolean snap), so the
    // TextField never shifts far enough in a single frame to lose focus.
    final keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    final logoHeight =
        (size.height * 0.45 - statusBarHeight - keyboardHeight)
            .clamp(0.0, double.infinity);

    return PopScope(
      canPop: !_anyFieldFocused,
      onPopInvokedWithResult: (bool didPop, _) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.navyDeep,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          bottom: false,
          child: Column(
          children: [
            // Shrinks by exactly the keyboard height as the keyboard rises.
            // The keyboard animation frames provide the animation — no
            // AnimatedContainer needed, and no focus-loss snap.
            SizedBox(
              height: logoHeight,
              child: Center(
                child: Image.asset(
                  'assets/logo_dark.png',
                  width: size.width * 0.5,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Bottom sheet — fills remaining space.
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.cream,
                  borderRadius: AppRadius.bottomSheet,
                ),
                // Column: scrollable form content + pinned terms footer.
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.manual,
                        padding: const EdgeInsets.only(
                          top: 28,
                          left: AppSpacing.lg,
                          right: AppSpacing.lg,
                          bottom: AppSpacing.md,
                        ),
                        child: _buildSheetContent(formState),
                      ),
                    ),
                    // Terms text pinned inside the cream sheet.
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: safeBottom + 12,
                        top: 4,
                      ),
                      child: const _TermsText(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }

  Widget _buildSheetContent(LoginFormState state) {
    return state.when(
      chooseMethod: _buildChooseMethod,
      emailPasswordEntry: _buildEmailPasswordEntry,
      emailPasswordSubmitting: (String email) {
        return _buildEmailPasswordEntry(email, '', false, null, loading: true);
      },
      googleSigningIn: _buildGoogleLoading,
      success: _buildSuccessLoading,
      error: (_) => _buildChooseMethod(),
      forgotPasswordEntry: (email, _) => _buildForgotPasswordEntry(email),
      forgotPasswordSent: _buildForgotPasswordSent,
    );
  }

  // --- State A: choose method ---

  Widget _buildChooseMethod() {
    final ctrl = ref.read<LoginController>(loginControllerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Image.asset(
            'assets/logo_mark_ligh.png',
            width: 36,
            height: 36,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Welcome to Ahara',
          style: AppTypography.displayMedium.copyWith(
            color: AppColors.navyDeep,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in or create your account',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 28),
        _GoogleButton(onPressed: ctrl.signInWithGoogle),
        const SizedBox(height: 12),
        _EmailMethodButton(onPressed: ctrl.selectEmail),
      ],
    );
  }

  static Widget _buildGoogleLoading() =>
      const LoadingState(message: 'Signing in with Google…');

  static Widget _buildSuccessLoading(User _) =>
      const LoadingState(message: 'Welcome!');

  // --- State B: email + password ---

  Widget _buildEmailPasswordEntry(
    String email,
    String password,
    bool isSignUpMode,
    String? errorMessage, {
    bool loading = false,
  }) {
    final ctrl = ref.read<LoginController>(loginControllerProvider.notifier);
    final isValid = email.isNotEmpty && password.length >= 6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            color: AppColors.navyDeep.withValues(alpha: 0.5),
            onPressed: ctrl.goBack,
            padding: EdgeInsets.zero,
          ),
        ),
        Text(
          isSignUpMode ? 'Create account' : 'Sign in',
          style: AppTypography.displayMedium.copyWith(
            color: AppColors.navyDeep,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              isSignUpMode
                  ? 'Already have an account? '
                  : "Don't have an account? ",
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            GestureDetector(
              onTap: ctrl.toggleSignUpMode,
              child: Text(
                isSignUpMode ? 'Sign in' : 'Create one',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.turmeric,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.turmeric,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        AppTextField(
          controller: _emailCtrl,
          focusNode: _emailFocusNode,
          placeholder: 'yourname@email.com',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: ctrl.updateEmailForPassword,
          onSubmitted: (_) => _passwordFocusNode.requestFocus(),
        ),
        const SizedBox(height: 12),
        AppTextField(
          controller: _passwordCtrl,
          focusNode: _passwordFocusNode,
          placeholder: 'Password',
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: _obscurePassword,
          onChanged: ctrl.updatePasswordField,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 20,
              color: AppColors.textHint,
            ),
            onPressed: () =>
                setState(() => _obscurePassword = !_obscurePassword),
          ),
          onSubmitted: isValid
              ? (_) => ctrl.submitEmailPassword(
                  _emailCtrl.text,
                  _passwordCtrl.text,
                )
              : null,
        ),
        if (!isSignUpMode) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: ctrl.selectForgotPassword,
              child: Text(
                'Forgot password?',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.turmeric,
                ),
              ),
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.md),
        AppButton(
          label: isSignUpMode ? 'Create account' : 'Sign in',
          onPressed: isValid
              ? () => ctrl.submitEmailPassword(
                  _emailCtrl.text,
                  _passwordCtrl.text,
                )
              : null,
          isLoading: loading,
        ),
      ],
    );
  }

  // --- State C: forgot password entry ---

  Widget _buildForgotPasswordEntry(String email) {
    final ctrl = ref.read<LoginController>(loginControllerProvider.notifier);
    final isValid = email.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            color: AppColors.navyDeep.withValues(alpha: 0.5),
            onPressed: _isForgotSubmitting ? null : ctrl.goBack,
            padding: EdgeInsets.zero,
          ),
        ),
        Text(
          'Reset password',
          style: AppTypography.displayMedium.copyWith(
            color: AppColors.navyDeep,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Enter your email and we'll send a reset link",
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 20),
        AppTextField(
          controller: _forgotEmailCtrl,
          focusNode: _forgotPasswordFocusNode,
          placeholder: 'yourname@email.com',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          onChanged: ctrl.updateForgotEmail,
          onSubmitted: isValid
              ? (_) => _submitForgotPassword(email)
              : null,
        ),
        const SizedBox(height: AppSpacing.md),
        AppButton(
          label: 'Send reset link',
          onPressed: isValid ? () => _submitForgotPassword(email) : null,
          isLoading: _isForgotSubmitting,
        ),
      ],
    );
  }

  // --- State D: forgot password sent ---

  Widget _buildForgotPasswordSent(String email) {
    final ctrl = ref.read<LoginController>(loginControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        Center(
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.turmeric.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: AppColors.turmeric,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Check your email',
          style: AppTypography.displayMedium.copyWith(
            color: AppColors.navyDeep,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          'We sent a reset link to $email',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 28),
        AppButton(
          label: 'Back to sign in',
          onPressed: ctrl.goBack,
        ),
      ],
    );
  }
}

class _GoogleButton extends StatelessWidget {
  const _GoogleButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.button,
        border: Border.all(color: AppColors.navyDeep, width: 1.5),
        boxShadow: AppShadows.button,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppRadius.button,
        child: InkWell(
          onTap: onPressed,
          borderRadius: AppRadius.button,
          child: const Row(
            children: [
              SizedBox(width: 20),
              Icon(Icons.g_mobiledata_rounded, size: 24),
              Expanded(child: Center(child: Text('Continue with Google'))),
              SizedBox(width: 44),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailMethodButton extends StatelessWidget {
  const _EmailMethodButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.creamDeep,
          foregroundColor: AppColors.navyDeep,
          side: const BorderSide(color: AppColors.navyDeep),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.button),
          textStyle: AppTypography.labelMedium,
        ),
        icon: const Icon(Icons.mail_outline_rounded, size: 20),
        label: const Text('Continue with email'),
      ),
    );
  }
}

class _TermsText extends StatelessWidget {
  const _TermsText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTypography.caption.copyWith(color: AppColors.textHint),
        children: [
          const TextSpan(text: "By continuing, you agree to Ahara's\n"),
          TextSpan(
            text: 'Terms of Service',
            style: AppTypography.caption.copyWith(color: AppColors.turmeric),
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: AppTypography.caption.copyWith(color: AppColors.turmeric),
          ),
        ],
      ),
    );
  }
}
