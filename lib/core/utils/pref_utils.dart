//ignore: unused_import
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdc_mobile/data/model/cart_model.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  // get user data
  static String? getUser() => _sharedPreferences?.getString("USER_LOGIN");

  // save user data
  static Future<bool>? setUser(String value) =>
      _sharedPreferences?.setString("USER_LOGIN", value);

  // remove user login data
  static Future<bool>? logout() => _sharedPreferences?.remove("USER_LOGIN");

  //set cart
  static void saveCart(CartModel cartModel) {
    final String cartJson = jsonEncode(cartModel.toJson());

    _sharedPreferences!.setString(jsonDecode(getUser() ?? "")["phone"], cartJson);
  }

  //get cart
  static CartModel? getCart() {
    final String? cartJson =
        _sharedPreferences?.getString(jsonDecode(getUser() ?? "")["phone"]);
    if (cartJson != null) {
      final Map<String, dynamic> cartMap = jsonDecode(cartJson);
      return CartModel.fromJson(cartMap);
    } else {
      return null;
    }
  }

  // get String data
  static String? getString(String key) => _sharedPreferences?.getString(key);

  // save String data
  static Future<bool>? setString(String key, String value) =>
      _sharedPreferences?.setString(key, value);

  // get bool data
  static bool? getBool(String key) => _sharedPreferences?.getBool(key);

  // save bool data
  static Future<bool>? setBool(String key, bool value) =>
      _sharedPreferences?.setBool(key, value);

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}
