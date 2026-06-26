import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/features/chat/domain/models/chat_message.dart';
import 'package:ahara/features/chat/domain/models/chat_recipe.dart';
import 'package:ahara/features/chat/presentation/widgets/chat_recipe_card.dart';
import 'package:ahara/features/chat/presentation/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';

/// Renders one chat message: a user bubble, an assistant bubble (with
/// markdown-lite text and inline recipe cards), or a system note.
class ChatMessageBubble extends StatelessWidget {
  /// Creates a [ChatMessageBubble].
  const ChatMessageBubble({
    required this.message,
    required this.onOpenRecipe,
    super.key,
  });

  /// The message to render.
  final ChatMessage message;

  /// Called to open an inline recipe's full detail screen.
  final void Function(ChatRecipe recipe) onOpenRecipe;

  @override
  Widget build(BuildContext context) {
    switch (message.role) {
      case ChatRole.system:
        return _SystemNote(text: message.content);
      case ChatRole.user:
        return _Bubble(
          alignment: Alignment.centerRight,
          color: AppColors.navyDeep,
          textColor: AppColors.textOnDark,
          tailLeft: false,
          child: Text(
            message.content,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textOnDark,
              height: 1.5,
            ),
          ),
        );
      case ChatRole.assistant:
        final showDots = message.isStreaming && message.content.isEmpty;
        return _Bubble(
          alignment: Alignment.centerLeft,
          color: AppColors.creamDeep,
          textColor: AppColors.textPrimary,
          tailLeft: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showDots)
                const TypingIndicator()
              else
                _MarkdownLite(text: message.content),
              for (final recipe in message.recipes)
                ChatRecipeCard(
                  recipe: recipe,
                  onOpen: () => onOpenRecipe(recipe),
                ),
            ],
          ),
        );
    }
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    required this.alignment,
    required this.color,
    required this.textColor,
    required this.tailLeft,
    required this.child,
  });

  final Alignment alignment;
  final Color color;
  final Color textColor;
  final bool tailLeft;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width * 0.85;
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(tailLeft ? 4 : 16),
            bottomRight: Radius.circular(tailLeft ? 16 : 4),
          ),
        ),
        child: child,
      ),
    );
  }
}

class _SystemNote extends StatelessWidget {
  const _SystemNote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

/// Minimal markdown renderer: `**bold**` inline + `-`/`*`/`1.` bullet lines.
class _MarkdownLite extends StatelessWidget {
  const _MarkdownLite({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final base = AppTypography.bodyLarge.copyWith(
      color: AppColors.textPrimary,
      height: 1.6,
    );
    final lines = text.split('\n');
    final children = <Widget>[];
    for (final line in lines) {
      final trimmed = line.trimLeft();
      final isBullet = trimmed.startsWith('- ') ||
          trimmed.startsWith('* ') ||
          RegExp(r'^\d+\.\s').hasMatch(trimmed);
      if (trimmed.isEmpty) {
        children.add(const SizedBox(height: 8));
        continue;
      }
      if (isBullet) {
        final content = trimmed.startsWith('- ') || trimmed.startsWith('* ')
            ? trimmed.substring(2)
            : trimmed.replaceFirst(RegExp(r'^\d+\.\s'), '');
        children.add(
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•  ', style: base),
                Expanded(
                  child: RichText(text: _inlineSpans(content, base)),
                ),
              ],
            ),
          ),
        );
      } else {
        children.add(RichText(text: _inlineSpans(trimmed, base)));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  /// Splits a line on `**bold**` markers into styled spans.
  TextSpan _inlineSpans(String line, TextStyle base) {
    final spans = <TextSpan>[];
    final pattern = RegExp(r'\*\*(.+?)\*\*');
    var index = 0;
    for (final match in pattern.allMatches(line)) {
      if (match.start > index) {
        spans.add(TextSpan(text: line.substring(index, match.start)));
      }
      spans.add(
        TextSpan(
          text: match.group(1),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      );
      index = match.end;
    }
    if (index < line.length) {
      spans.add(TextSpan(text: line.substring(index)));
    }
    return TextSpan(style: base, children: spans);
  }
}
