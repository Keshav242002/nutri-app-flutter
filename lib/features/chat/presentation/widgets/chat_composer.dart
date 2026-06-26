import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Composer input mode.
enum ComposerMode {
  /// Free-form conversation.
  chat,

  /// Ingredient-list recipe generation.
  ingredient,
}

/// Bottom composer for the chat screen.
///
/// Free-chat: a pill input + turmeric send button. Ingredient mode: a chip
/// builder + full-width "What can I make?" turmeric button. A quiet ⊕ toggle
/// on the left switches modes. The single turmeric element is the primary
/// action of whichever mode is active.
class ChatComposer extends StatefulWidget {
  /// Creates a [ChatComposer].
  const ChatComposer({
    required this.controller,
    required this.enabled,
    required this.onSendChat,
    required this.onSendIngredient,
    super.key,
  });

  /// The text controller for the free-chat / question field (shared so the
  /// screen can pre-fill it from an example prompt).
  final TextEditingController controller;

  /// Whether sending is allowed (false while a reply is in flight).
  final bool enabled;

  /// Called with the trimmed free-chat message.
  final ValueChanged<String> onSendChat;

  /// Called with the question text + ingredient list.
  final void Function(String question, List<String> ingredients)
      onSendIngredient;

  @override
  State<ChatComposer> createState() => _ChatComposerState();
}

class _ChatComposerState extends State<ChatComposer> {
  ComposerMode _mode = ComposerMode.chat;
  final _ingredients = <String>[];
  final _ingredientField = TextEditingController();
  final _ingredientFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    // Rebuild so the "+ Add" affordance and the submit button's enabled state
    // track what's currently typed in the ingredient field.
    _ingredientField.addListener(_onIngredientChanged);
  }

  @override
  void dispose() {
    _ingredientField
      ..removeListener(_onIngredientChanged)
      ..dispose();
    _ingredientFocus.dispose();
    super.dispose();
  }

  void _onIngredientChanged() => setState(() {});

  bool get _hasPendingIngredient => _ingredientField.text.trim().isNotEmpty;

  bool get _canSubmitIngredients =>
      widget.enabled && (_ingredients.isNotEmpty || _hasPendingIngredient);

  void _toggleMode() {
    setState(() {
      _mode = _mode == ComposerMode.chat
          ? ComposerMode.ingredient
          : ComposerMode.chat;
    });
  }

  void _addIngredient(String raw) {
    // Accept comma- or newline-separated entries in one go.
    final parts = raw
        .split(RegExp('[,\n]'))
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty);
    var added = false;
    for (final value in parts) {
      if (!_ingredients.contains(value)) {
        _ingredients.add(value);
        added = true;
      }
    }
    _ingredientField.clear();
    if (added) setState(() {});
    // Keep focus so the user can add several in a row.
    _ingredientFocus.requestFocus();
  }

  void _sendChat() {
    final text = widget.controller.text.trim();
    if (text.isEmpty || !widget.enabled) return;
    widget.onSendChat(text);
    widget.controller.clear();
  }

  void _sendIngredient() {
    if (!widget.enabled) return;
    // Flush any text still sitting in the add field so a forgotten "add" tap
    // doesn't silently drop an ingredient.
    if (_hasPendingIngredient) _addIngredient(_ingredientField.text);
    if (_ingredients.isEmpty) return;
    widget.onSendIngredient(widget.controller.text.trim(), [..._ingredients]);
    widget.controller.clear();
    _ingredientField.clear();
    setState(() {
      _ingredients.clear();
      _mode = ComposerMode.chat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cream,
        border: Border(top: BorderSide(color: AppColors.creamBorder)),
      ),
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenHorizontal,
        AppSpacing.sm,
        AppSpacing.screenHorizontal,
        MediaQuery.viewPaddingOf(context).bottom + AppSpacing.sm,
      ),
      child: _mode == ComposerMode.chat ? _buildChatBar() : _buildIngredient(),
    );
  }

  Widget _buildChatBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _ModeToggle(active: false, onTap: _toggleMode),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: _pill(widget.controller, 'Ask about your meals…')),
        const SizedBox(width: AppSpacing.sm),
        _SendButton(
          enabled: widget.enabled,
          icon: Icons.arrow_upward_rounded,
          onTap: _sendChat,
        ),
      ],
    );
  }

  Widget _buildIngredient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            _ModeToggle(active: true, onTap: _toggleMode),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'What ingredients do you have?',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        if (_ingredients.isNotEmpty) ...[
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              for (final item in _ingredients)
                _IngredientChip(
                  label: item,
                  onRemove: () => setState(() => _ingredients.remove(item)),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        _pill(
          _ingredientField,
          'Add an ingredient…',
          focusNode: _ingredientFocus,
          onSubmitted: _addIngredient,
          textInputAction: TextInputAction.done,
          trailing: _AddIngredientButton(
            enabled: _hasPendingIngredient,
            onTap: () => _addIngredient(_ingredientField.text),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        _pill(widget.controller, 'Anything specific? (optional)'),
        const SizedBox(height: AppSpacing.sm),
        _WhatCanIMakeButton(
          enabled: _canSubmitIngredients,
          onTap: _sendIngredient,
        ),
      ],
    );
  }

  Widget _pill(
    TextEditingController controller,
    String hint, {
    ValueChanged<String>? onSubmitted,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    Widget? trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: BorderRadius.circular(999),
      ),
      padding: EdgeInsets.only(
        left: AppSpacing.md,
        right: trailing != null ? 6 : AppSpacing.md,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              minLines: 1,
              maxLines: 4,
              textInputAction: textInputAction,
              onSubmitted: onSubmitted,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textHint,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}

class _AddIngredientButton extends StatelessWidget {
  const _AddIngredientButton({required this.enabled, required this.onTap});

  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: enabled ? AppColors.navySubtle : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_rounded,
              size: 16,
              color: enabled ? AppColors.navyDeep : AppColors.textHint,
            ),
            const SizedBox(width: 2),
            Text(
              'Add',
              style: AppTypography.labelMedium.copyWith(
                color: enabled ? AppColors.navyDeep : AppColors.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeToggle extends StatelessWidget {
  const _ModeToggle({required this.active, required this.onTap});

  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: active ? AppColors.navySubtle : AppColors.creamDeep,
          shape: BoxShape.circle,
        ),
        child: Icon(
          active ? Icons.close_rounded : Icons.eco_outlined,
          size: 20,
          color: AppColors.navyDeep,
        ),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({
    required this.enabled,
    required this.icon,
    required this.onTap,
  });

  final bool enabled;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: enabled ? AppColors.turmeric : AppColors.turmericDim,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: AppColors.navyDeep),
      ),
    );
  }
}

class _WhatCanIMakeButton extends StatelessWidget {
  const _WhatCanIMakeButton({required this.enabled, required this.onTap});

  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled ? AppColors.turmeric : AppColors.turmericDim,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'What can I make?',
          style: AppTypography.labelLarge.copyWith(color: AppColors.navyDeep),
        ),
      ),
    );
  }
}

class _IngredientChip extends StatelessWidget {
  const _IngredientChip({required this.label, required this.onRemove});

  final String label;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: AppColors.creamDeep,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.creamBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close_rounded,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
