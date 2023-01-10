import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreference {
  static const stateLogin = 'stateLogin';
  static const modelUser = 'modelUser';

  Future setStateLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(stateLogin, value);
  }

  static Future getStateLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(stateLogin) ?? false;
  }
}
enum SupportState {
  unknown,
  supported,
  unsupported,
}