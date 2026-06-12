import 'package:ahara/app.dart';
import 'package:ahara/core/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment from --dart-define values.
  Env.initialize();

  runApp(const ProviderScope(child: AharaApp()));
}
