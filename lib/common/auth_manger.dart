import 'package:appleshop1/common/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// this class for AuthManger example Login and SigIn etc .....
class AuthManger {
  static final SharedPreferences _sharedPreferences = locator.get();
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);

  static void saveToken(String token) {
    _sharedPreferences.setString('access_token', token);
    authChangeNotifire.value = token;
  }

  static String readAuth() {
    return _sharedPreferences.getString('access_token') ?? '';
  }

  static void logOut() {
    _sharedPreferences.clear();
    authChangeNotifire.value = null;
  }
}
