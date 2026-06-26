// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages state for the Chat tab.
///
/// On build: loads the newest session (if any) and its messages. The session
/// is created lazily on the first send.

@ProviderFor(ChatController)
final chatControllerProvider = ChatControllerProvider._();

/// Manages state for the Chat tab.
///
/// On build: loads the newest session (if any) and its messages. The session
/// is created lazily on the first send.
final class ChatControllerProvider
    extends $AsyncNotifierProvider<ChatController, ChatState> {
  /// Manages state for the Chat tab.
  ///
  /// On build: loads the newest session (if any) and its messages. The session
  /// is created lazily on the first send.
  ChatControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatControllerHash();

  @$internal
  @override
  ChatController create() => ChatController();
}

String _$chatControllerHash() => r'e3c4d5f60718293a4b5c6d7e8f90123456789abc';

/// Manages state for the Chat tab.
///
/// On build: loads the newest session (if any) and its messages. The session
/// is created lazily on the first send.

abstract class _$ChatController extends $AsyncNotifier<ChatState> {
  FutureOr<ChatState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ChatState>, ChatState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ChatState>, ChatState>,
              AsyncValue<ChatState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
