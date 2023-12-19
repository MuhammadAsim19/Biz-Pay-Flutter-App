import 'package:buysellbiz/Data/AppData/app_preferences.dart';

mixin AppInitializer {
  static void init() {
    Future.wait([_user()]);
  }

  static Future _user() async {
    await SharedPrefs.getUserLoginData();
  }
}
