import 'package:ahara/core/network/api_exceptions.dart';
import 'package:ahara/core/routing/route_paths.dart';
import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/widgets/error_state.dart';
import 'package:ahara/features/chat/domain/models/chat_recipe.dart';
import 'package:ahara/features/chat/domain/models/chat_state.dart';
import 'package:ahara/features/chat/presentation/controllers/chat_controller.dart';
import 'package:ahara/features/chat/presentation/widgets/chat_composer.dart';
import 'package:ahara/features/chat/presentation/widgets/chat_empty_state.dart';
import 'package:ahara/features/chat/presentation/widgets/chat_message_bubble.dart';
import 'package:ahara/features/chat/presentation/widgets/chat_sessions_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The Chat tab — a single conversation with the Ahara assistant.
class ChatScreen extends ConsumerStatefulWidget {
  /// Creates a [ChatScreen].
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _input = TextEditingController();
  final _scroll = ScrollController();
  final _inputFocus = FocusNode();

  @override
  void dispose() {
    _input.dispose();
    _scroll.dispose();
    _inputFocus.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.jumpTo(_scroll.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Auto-scroll to the newest message whenever the message list grows.
    ref.listen(chatControllerProvider, (_, __) => _scrollToBottom());

    final asyncState = ref.watch(chatControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        surfaceTintColor: AppColors.cream,
        title: Text('Chat', style: AppTypography.headingLarge),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.history_rounded,
              color: AppColors.navyDeep,
            ),
            onPressed: _openSessionsSheet,
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: asyncState.when(
          loading: () => const _ThreadSkeleton(),
          error: (error, __) => ErrorState(
            exception: error is AppException
                ? error
                : const UnknownException(message: 'Couldn’t load chat.'),
            onRetry: () => ref.invalidate(chatControllerProvider),
          ),
          data: _buildBody,
        ),
      ),
    );
  }

  Future<void> _openSessionsSheet() async {
    final result = await ChatSessionsSheet.show(context);
    if (result == null || !mounted) return;
    final controller = ref.read(chatControllerProvider.notifier);
    final session = result.session;
    if (session != null) {
      await controller.openSession(session);
    } else {
      await controller.startNewSession();
    }
  }

  Widget _buildBody(ChatState state) {
    final showEmpty = state.messages.isEmpty && !state.isSending;
    return Column(
      children: [
        Expanded(
          child: showEmpty
              ? ChatEmptyState(onPromptTap: _prefillPrompt)
              : ListView.builder(
                  controller: _scroll,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenHorizontal,
                    vertical: AppSpacing.md,
                  ),
                  itemCount: state.messages.length,
                  itemBuilder: (_, i) {
                    final msg = state.messages[i];
                    return ChatMessageBubble(
                      message: msg,
                      onOpenRecipe: _openRecipe,
                    );
                  },
                ),
        ),
        if (state.rateLimited) const _RateLimitNote(),
        if (state.sendFailed) _RetryRow(onRetry: _retry),
        ChatComposer(
          controller: _input,
          enabled: !state.isSending,
          onSendChat: (text) =>
              ref.read(chatControllerProvider.notifier).sendChat(text),
          onSendIngredient: (question, ingredients) => ref
              .read(chatControllerProvider.notifier)
              .sendIngredient(question, ingredients),
        ),
      ],
    );
  }

  void _prefillPrompt(String prompt) {
    _input
      ..text = prompt
      ..selection = TextSelection.collapsed(offset: prompt.length);
    _inputFocus.requestFocus();
    FocusScope.of(context).requestFocus(_inputFocus);
  }

  void _retry() => ref.read(chatControllerProvider.notifier).retryLast();

  void _openRecipe(ChatRecipe recipe) {
    if (recipe.slug.isEmpty) return;
    context.push('${RoutePaths.chat}/recipe/${recipe.slug}');
  }
}

class _RateLimitNote extends StatelessWidget {
  const _RateLimitNote();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.sm,
      ),
      child: Text(
        'You’ve reached your chat limit for this hour — back soon.',
        textAlign: TextAlign.center,
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _RetryRow extends StatelessWidget {
  const _RetryRow({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Couldn’t get a reply.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          GestureDetector(
            onTap: onRetry,
            child: Text(
              'Retry',
              style: AppTypography.labelLarge.copyWith(
                color: AppColors.turmeric,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThreadSkeleton extends StatelessWidget {
  const _ThreadSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.md,
      ),
      children: [
        _bar(context, 0.6, Alignment.centerLeft),
        _bar(context, 0.4, Alignment.centerRight),
        _bar(context, 0.7, Alignment.centerLeft),
      ],
    );
  }

  Widget _bar(BuildContext context, double widthFactor, Alignment align) {
    return Align(
      alignment: align,
      child: Container(
        width: MediaQuery.sizeOf(context).width * widthFactor,
        height: 44,
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.creamDeep,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
