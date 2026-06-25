// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads and mutates the notification feed shown from the home bell.

@ProviderFor(NotificationsListController)
final notificationsListControllerProvider =
    NotificationsListControllerProvider._();

/// Loads and mutates the notification feed shown from the home bell.
final class NotificationsListControllerProvider
    extends
        $AsyncNotifierProvider<
          NotificationsListController,
          List<NotificationItem>
        > {
  /// Loads and mutates the notification feed shown from the home bell.
  NotificationsListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsListControllerHash();

  @$internal
  @override
  NotificationsListController create() => NotificationsListController();
}

String _$notificationsListControllerHash() =>
    r'6ba413baf891401626333206fdce9a17ee6baadd';

/// Loads and mutates the notification feed shown from the home bell.

abstract class _$NotificationsListController
    extends $AsyncNotifier<List<NotificationItem>> {
  FutureOr<List<NotificationItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<NotificationItem>>, List<NotificationItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<NotificationItem>>,
                List<NotificationItem>
              >,
              AsyncValue<List<NotificationItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
