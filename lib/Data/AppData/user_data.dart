import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';

mixin UserData {
  static String? userToken;

  static UserModel? userData;

  set token(String? token) => userToken = token;

  set user(UserModel? userModel) => userData = userModel;

  UserModel? get user => userData;

  String? get token => userToken;
}
