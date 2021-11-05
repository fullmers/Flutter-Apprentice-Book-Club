import 'package:shared_preferences/shared_preferences.dart';

abstract class Persistence {
  void setKey(String key, String value);
  String? getKey(String key);
}

class SharedPreferencesPersistence implements Persistence {
  SharedPreferencesPersistence(this._sharedPrefs);
  final SharedPreferences _sharedPrefs;

  @override
  String? getKey(String key) => _sharedPrefs.getString(key);

  @override
  void setKey(String key, String value) => _sharedPrefs.setString(key, value);
}
