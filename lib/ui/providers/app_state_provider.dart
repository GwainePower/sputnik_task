import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboading_task/data/app_state/shared_prefs.dart';

final sharedPrefsProvider = Provider<SharedPrefs>((ref) {
  return SharedPrefs();
});
