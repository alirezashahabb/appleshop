import 'package:appleshop1/di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManger {
  /// this property for observe token
  static final ValueNotifier<String?> notifierAuth = ValueNotifier(null);

  /// this property use shareprefance
  static final SharedPreferences _preferences = locator.get();

  /// this method for save token
  static void saveAuth(String token) {
    _preferences.setString('access_token', token);
    notifierAuth.value = token;
  }

  /// this method for read token
  static String readAuth() {
    return _preferences.getString('access_token') ?? '';
  }

  /// this method for  log out for user
  static void logout() {
    _preferences.clear();
    notifierAuth.value = null;
  }

  /// this method check user is login or not
  bool isLOgin() {
    return readAuth().isNotEmpty;
  }
}
