import 'dart:convert';

import 'package:elixr_poc/authentication/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferenceHelper {
  static final Future<SharedPreferences> _pref =
      SharedPreferences.getInstance();

  static Future<void> setUser(User user) async {
    var jsonData = jsonEncode(user.toMap());

    try {
      SharedPreferences preferences = await _pref;
      preferences.setString(user.email, jsonData);
    } catch (e) {
      rethrow;
    }
  }

  static Future<User> getUser(String email) async {
    SharedPreferences preferences = await _pref;
    try {
      String jsonData = preferences.getString(email) ?? '';
      debugPrint(User.fromMap(jsonDecode(jsonData)).toString());
      return User.fromMap(jsonDecode(jsonData));
    } catch (e) {
      throw "user not found";
    }
  }
}
