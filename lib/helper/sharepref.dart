import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static SharedPreferences? _preferences;
  static const _user = 'user';

  static Future init() async {
    return _preferences = await SharedPreferences.getInstance();
  }

  static Future removeUser() => _preferences!.remove(_user);

  static Future setUser(String value) async =>
      await _preferences!.setString(_user, value);
  static String? getUser() => _preferences!.getString(_user);

}
