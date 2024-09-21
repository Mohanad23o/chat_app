import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static late SharedPreferences prefs;

  static Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<bool> saveData(String key, dynamic value) {
    if (value is String) {
      return prefs.setString(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else {
      return prefs.setStringList(key, value);
    }
  }

  static Object? loadData(String key) {
    return prefs.get(key);
  }

  static Future<bool> removeData(String key) async {
    return await prefs.remove(key);
  }
}
