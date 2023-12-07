import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class LoginRepo {
  Future<Map<String, dynamic>> login(
      {required Map<String, dynamic> body}) async {
    try {
      return await ApiService.post(ApiConstant.login, body).then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
