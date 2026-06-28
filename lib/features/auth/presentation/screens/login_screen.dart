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
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _onStateChanged(LoginFormState? _, LoginFormState next) {
    next.maybeWhen(
      success: (User __) => context.go(RoutePaths.home),
      error: (String msg) {
        ref.read(toastProvider.notifier).show(msg);
        ref.read(loginControllerProvider.notifier).goBack();
      },
      emailPasswordEntry: (_, __, ___, String? errorMessage) {
        if (errorMessage != null) {
          ref.read(toastProvider.notifier).show(errorMessage);
          ref.read(loginControllerProvider.notifier).clearEmailPasswordError();
        }
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch<LoginFormState>(loginControllerProvider);
    ref.listen<LoginFormState>(loginControllerProvider, _onStateChanged);

    final size = MediaQuery.sizeOf(context);

    final safeBottom = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.navyDeep,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const SizedBox.expand(child: ColoredBox(color: AppColors.navyDeep)),
          // Brand logo centered in the empty navy area above the sheet.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.45,
            child: Center(
              child: Image.asset(
                'assets/logo_dark.png',
                width: size.width * 0.5,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              constraints: BoxConstraints(
                minHeight: size.height * 0.5 + 16,
                maxHeight: size.height * 0.85,
              ),
              decoration: const BoxDecoration(
                color: AppColors.cream,
                borderRadius: AppRadius.bottomSheet,
              ),
              padding: EdgeInsets.only(
                top: 28,
                left: AppSpacing.lg,
                right: AppSpacing.lg,
                // Extra 48px keeps content above the pinned terms text.
                bottom:
                    MediaQuery.viewInsetsOf(context).bottom +
                    safeBottom +
                    48 +
                    AppSpacing.md,
              ),
              child: SingleChildScrollView(
                child: _buildSheetContent(formState),
              ),
            ),
          ),
          // Terms always pinned to the absolute bottom of the screen.
          Positioned(
            bottom: safeBottom + 12,
            left: 0,
            right: 0,
            child: const _TermsText(),
          ),
        ],
      ),
    );
  }

  Widget _buildSheetContent(LoginFormState state) {
    return state.when(
      chooseMethod: _buildChooseMethod,
      emailPasswordEntry: _buildEmailPasswordEntry,
      emailPasswordSubmitting: (String email) {
        // Read the previous state's isSignUpMode before it was replaced with
        // emailPasswordSubmitting — it was already captured in the controller.
        // Since submitting hides the toggle, default false is fine visually,
        // but the title should match what the user was doing.
        return _buildEmailPasswordEntry(email, '', false, null, loading: true);
      },
      googleSigningIn: _buildGoogleLoading,
      success: _buildSuccessLoading,
      // Error is surfaced via toast; render choose-method while toast shows.
      error: (_) => _buildChooseMethod(),
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
    if (_emailCtrl.text != email) _emailCtrl.text = email;
    if (_passwordCtrl.text != password) _passwordCtrl.text = password;

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
          placeholder: 'yourname@email.com',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          autofocus: true,
          onChanged: ctrl.updateEmailForPassword,
        ),
        const SizedBox(height: 12),
        AppTextField(
          controller: _passwordCtrl,
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
