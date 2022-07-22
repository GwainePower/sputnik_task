import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/app_state/shared_prefs.dart';

final sharedPrefsProvider = Provider<SharedPrefs>((ref) {
  return SharedPrefs();
});
