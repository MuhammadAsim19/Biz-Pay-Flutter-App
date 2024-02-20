import 'package:buysellbiz/Data/AppData/app_preferences.dart';

mixin AppInitializer {
  static Future init() async {
  _user();
  }

  static Future _user() async {
    await SharedPrefs.getUserLoginData();
    SharedPrefs.getUserToken();
  }
}
