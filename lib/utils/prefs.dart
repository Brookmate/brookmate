import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late final SharedPreferences preferences;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    return preferences;
  }

  static setString(String key, String value) {
    preferences.setString(key, value);
  }

  static setMap(String key, Map<String, dynamic> map) {
    preferences.setString(key, jsonEncode(map));
  }

  static setInt(String key, int value) {
    preferences.setInt(key, value);
  }

  static setDouble(String key, double value) {
    preferences.setDouble(key, value);
  }

  static setBool(String key, bool value) {
    preferences.setBool(key, value);
  }

  static String getString(String key) {
    return preferences.getString(key) ?? "";
  }

  static Map<String, dynamic> getMap(String key) {
    String? value = preferences.getString(key);
    if (value == null) {
      return jsonDecode("{}");
    }
    return jsonDecode(value);
  }

  static int getInt(String key) {
    int? value = preferences.getInt(key);
    if (value == null) {
      throw Exception("Null value returned");
    }
    return value;
  }

  static bool getBool(String key) {
    bool? value = preferences.getBool(key);
    if (value == null) {
      throw Exception("Null value returned");
    }
    return value;
  }

  static double getDouble(String key) {
    double? value = preferences.getDouble(key);
    if (value == null) {
      throw Exception("Null value returned");
    }
    return value;
  }

  static Future<bool> remove(String key) {
    return preferences.remove(key);
  }
}
