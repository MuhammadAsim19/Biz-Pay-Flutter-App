import 'dart:convert';


import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  /// reference of Shared Preferences
  static SharedPreferences? _preferences;
  static UserModel? userData;

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
  static UserModel? getUserLoginData() {
    String? userJson = _preferences!.getString("user") ?? "no_data";
    if (userJson == "no_data") {
      return userData;
    } else {
      userData = UserModel.fromRawJson(userJson);

      return userData;
    }
  }




}
