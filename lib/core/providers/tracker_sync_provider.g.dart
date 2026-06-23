// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A monotonically increasing revision counter, bumped after every successful
/// meal-log write (`POST /tracker/log/`) from any screen.

@ProviderFor(TrackerLogRevision)
final trackerLogRevisionProvider = TrackerLogRevisionProvider._();

/// A monotonically increasing revision counter, bumped after every successful
/// meal-log write (`POST /tracker/log/`) from any screen.
final class TrackerLogRevisionProvider
    extends $NotifierProvider<TrackerLogRevision, int> {
  /// A monotonically increasing revision counter, bumped after every successful
  /// meal-log write (`POST /tracker/log/`) from any screen.
  TrackerLogRevisionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackerLogRevisionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackerLogRevisionHash();

  @$internal
  @override
  TrackerLogRevision create() => TrackerLogRevision();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$trackerLogRevisionHash() =>
    r'00000000000000000000000000000000trackrev';

/// A monotonically increasing revision counter, bumped after every successful
/// meal-log write (`POST /tracker/log/`) from any screen.

abstract class _$TrackerLogRevision extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
