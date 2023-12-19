import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';

mixin UserData {
  static UserModel? userData;

  set user(UserModel? userModel) => userData = userModel;

  UserModel? get user => userData;
}
