// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_count_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Unread-notification count for the home-appbar bell badge.
///
/// Refreshes itself whenever a push arrives or a notification is tapped
/// (via [PushMessagingService.onNotificationChange]). Kept alive so the badge
/// stays warm across navigation.

@ProviderFor(UnreadCountController)
final unreadCountControllerProvider = UnreadCountControllerProvider._();

/// Unread-notification count for the home-appbar bell badge.
///
/// Refreshes itself whenever a push arrives or a notification is tapped
/// (via [PushMessagingService.onNotificationChange]). Kept alive so the badge
/// stays warm across navigation.
final class UnreadCountControllerProvider
    extends $AsyncNotifierProvider<UnreadCountController, int> {
  /// Unread-notification count for the home-appbar bell badge.
  ///
  /// Refreshes itself whenever a push arrives or a notification is tapped
  /// (via [PushMessagingService.onNotificationChange]). Kept alive so the badge
  /// stays warm across navigation.
  UnreadCountControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unreadCountControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unreadCountControllerHash();

  @$internal
  @override
  UnreadCountController create() => UnreadCountController();
}

String _$unreadCountControllerHash() =>
    r'71431b57d2a50a1fd590078c7d113783cd3e230c';

/// Unread-notification count for the home-appbar bell badge.
///
/// Refreshes itself whenever a push arrives or a notification is tapped
/// (via [PushMessagingService.onNotificationChange]). Kept alive so the badge
/// stays warm across navigation.

abstract class _$UnreadCountController extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
