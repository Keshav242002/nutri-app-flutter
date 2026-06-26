import 'package:ahara/core/theme/app_colors.dart';
import 'package:ahara/core/theme/app_spacing.dart';
import 'package:ahara/core/theme/app_typography.dart';
import 'package:ahara/core/utils/result.dart';
import 'package:ahara/core/widgets/app_modal_sheet.dart';
import 'package:ahara/features/chat/domain/models/chat_session.dart';
import 'package:ahara/features/chat/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bottom sheet listing the user's chat sessions, with a "New chat" action.
///
/// Returns the selected [ChatSession] (to open), or `null` if the user
/// requested a brand-new session or dismissed the sheet.
class ChatSessionsSheet extends ConsumerStatefulWidget {
  /// Creates a [ChatSessionsSheet].
  const ChatSessionsSheet({super.key});

  /// Shows the sheet. Resolves to a [ChatSessionsResult] describing the choice.
  static Future<ChatSessionsResult?> show(BuildContext context) {
    return AppModalSheet.show<ChatSessionsResult>(
      context,
      child: const ChatSessionsSheet(),
    );
  }

  @override
  ConsumerState<ChatSessionsSheet> createState() => _ChatSessionsSheetState();
}

class _ChatSessionsSheetState extends ConsumerState<ChatSessionsSheet> {
  late Future<List<ChatSession>> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<List<ChatSession>> _load() async {
    final result = await ref.read(chatRepositoryProvider).getSessions();
    return switch (result) {
      Success(:final data) => data.items,
      Failure() => <ChatSession>[],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Your chats', style: AppTypography.headingMedium),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(
                const ChatSessionsResult.newSession(),
              ),
              child: Text(
                'New chat',
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.turmeric,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.5,
          ),
          child: FutureBuilder<List<ChatSession>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Padding(
                  padding: EdgeInsets.all(AppSpacing.lg),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final sessions = snapshot.data ?? const [];
              if (sessions.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.lg,
                  ),
                  child: Text(
                    'No chats yet — start one above.',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemCount: sessions.length,
                separatorBuilder: (_, __) =>
                    const Divider(color: AppColors.creamBorder, height: 1),
                itemBuilder: (_, i) => _SessionRow(
                  session: sessions[i],
                  onTap: () => Navigator.of(context).pop(
                    ChatSessionsResult.open(sessions[i]),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SessionRow extends StatelessWidget {
  const _SessionRow({required this.session, required this.onTap});

  final ChatSession session;
  final VoidCallback onTap;

  String get _title =>
      session.title.isNotEmpty ? session.title : 'Chat · ${_date()}';

  String _date() {
    final d = session.lastMessageAt ?? session.startedAt;
    if (d == null) return '';
    return '${d.day}/${d.month}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _title,
                style: AppTypography.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              '${session.messageCount} msgs',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The outcome of [ChatSessionsSheet].
///
/// [session] is non-null when the user picked an existing chat to open; it is
/// `null` when the user asked to start a new session.
class ChatSessionsResult {
  /// Result for opening an existing [session].
  const ChatSessionsResult.open(ChatSession this.session);

  /// Result for starting a fresh session.
  const ChatSessionsResult.newSession() : session = null;

  /// The session to open, or `null` for a new session.
  final ChatSession? session;
}
