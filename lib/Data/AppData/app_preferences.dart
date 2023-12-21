import 'dart:convert';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  /// reference of Shared Preferences
  static SharedPreferences? _preferences;

  /// Initialization of Shared Preferences
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  ///survey

  ///UserData stored in json
  ///userRawData will be in map<String,dynamic>
  static Future setUserLoginData(
          {required Map<String, dynamic> userRawData}) async =>
      await _preferences?.setString("user", jsonEncode(userRawData));

  //
  //
  static Future<UserModel>? getUserLoginData() {
    String? userJson;
    if (_preferences!.containsKey('user')) {
      userJson = _preferences!.getString("user");
      if (userJson != null) {
        Data.app.user = UserModel.fromRawJson(userJson);
      }
    }
    return Future.value(Data.app.user);
  }
}
