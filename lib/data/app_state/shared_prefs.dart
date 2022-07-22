import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<SharedPreferences> _prefsInstance() async =>
      await SharedPreferences.getInstance();

  static Future<bool> getFirstLaunched() async => await _prefsInstance()
      .then((instance) => instance.getBool('firstLaunched') ?? true);

  Future<void> setFirstLaunched() async => await _prefsInstance()
      .then((instance) => instance.setBool('firstLaunched', false));
}
