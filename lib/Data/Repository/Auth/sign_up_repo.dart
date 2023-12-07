import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class SignUpRepo {
  static Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> body}) async {
    try {
      return await ApiService.post(ApiConstant.signUp, body).then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
