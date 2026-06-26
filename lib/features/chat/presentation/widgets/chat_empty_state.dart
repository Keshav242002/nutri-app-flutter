import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Example prompts offered on the empty chat thread.
const kChatExamplePrompts = <String>[
  'What can I make with paneer and spinach?',
  'Swap chicken for something vegetarian in my lunch',
  'Is dal enough protein for dinner?',
];

/// Calm empty state for a session with no messages yet.
///
/// Serif greeting + tappable example-prompt chips that pre-fill the composer.
class ChatEmptyState extends StatelessWidget {
  /// Creates a [ChatEmptyState].
  const ChatEmptyState({required this.onPromptTap, super.key});

  /// Called with the chosen example prompt; the composer pre-fills with it.
  final ValueChanged<String> onPromptTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.xxl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ask me anything\nabout your meals.',
            style: AppTypography.displayMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Get recipe ideas, swaps, and nutrition guidance — '
            'tuned to your plan.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          for (final prompt in kChatExamplePrompts)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _PromptChip(
                label: prompt,
                onTap: () => onPromptTap(prompt),
              ),
            ),
        ],
      ),
    );
  }
}

class _PromptChip extends StatelessWidget {
  const _PromptChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: AppColors.creamDeep,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.creamBorder),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.auto_awesome_rounded,
              size: 16,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                label,
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
