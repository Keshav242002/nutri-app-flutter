import 'dart:async';
import 'dart:developer' as dev;

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_provider.g.dart';

/// Visual severity of a toast notification.
enum ToastType {
  /// Operation completed successfully.
  success,

  /// Operation failed or produced an error.
  error,
}

/// A transient notification message.
class ToastMessage {
  /// Creates a [ToastMessage].
  const ToastMessage({required this.message, required this.type});

  /// The human-readable text to display.
  final String message;

  /// Whether this is a success or error notification.
  final ToastType type;
}

/// Holds the currently visible [ToastMessage], or `null` when none is shown.
///
/// Call [show] to display a toast; it auto-dismisses after 2 seconds.
@riverpod
class ToastNotifier extends _$ToastNotifier {
  Timer? _timer;

  @override
  ToastMessage? build() => null;

  /// Shows [message] as a toast and auto-dismisses after 2 seconds.
  void show(String message, {ToastType type = ToastType.error}) {
    _timer?.cancel();
    state = ToastMessage(message: message, type: type);
    if (type == ToastType.error) dev.log(message, name: 'Toast');
    _timer = Timer(const Duration(seconds: 2), dismiss);
  }

  /// Hides the current toast immediately.
  void dismiss() {
    _timer?.cancel();
    _timer = null;
    state = null;
  }
}
