/// A cursor-paginated page of items from a chat list endpoint.
///
/// Wraps the standard envelope's `data` object: `{ results, next, previous }`.
class ChatPage<T> {
  /// Creates a [ChatPage].
  const ChatPage({required this.items, this.next, this.previous});

  /// Builds a page from the envelope `data` object, mapping each result row
  /// with [fromItem].
  factory ChatPage.fromData(
    Map<String, dynamic> data,
    T Function(Map<String, dynamic> item) fromItem,
  ) {
    final results = (data['results'] as List? ?? const [])
        .cast<Map<String, dynamic>>()
        .map(fromItem)
        .toList();
    return ChatPage(
      items: results,
      next: data['next'] as String?,
      previous: data['previous'] as String?,
    );
  }

  /// Rows in this page.
  final List<T> items;

  /// Cursor URL for the next page, or `null` if none.
  final String? next;

  /// Cursor URL for the previous page, or `null` if none.
  final String? previous;
}
