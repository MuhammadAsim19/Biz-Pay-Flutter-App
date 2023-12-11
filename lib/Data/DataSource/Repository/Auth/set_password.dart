import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class SetPassword {
  static Future<Map<String, dynamic>> setPassword(
      {required String token, required String password}) async {
    var body = {
      "reset_password_token": token,
      "newPassword": password,
    };
    try {
      return await ApiService.post(ApiConstant.setPassword, body).then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
