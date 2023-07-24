import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider {
  final SharedPreferences _preferences;

  StorageProvider({
    required SharedPreferences sharedPreferences,
  }) : _preferences = sharedPreferences;

  Future<void> setString(String key, String value) async {
    _preferences.setString(key, value);
  }

  String getString(String key) {
    return _preferences.getString(key) ?? '';
  }
}
