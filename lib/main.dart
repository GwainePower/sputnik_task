import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/app_state/shared_prefs.dart';

import 'ui/app/sputnik_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firstLaunched = await SharedPrefs.getFirstLaunched();
  runApp(
    ProviderScope(
      child: SputnikApp(
        firstLaunched: firstLaunched,
      ),
    ),
  );
}
