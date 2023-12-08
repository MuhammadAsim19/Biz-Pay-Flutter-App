import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class ForgetEmail {
  static Future<Map<String, dynamic>> forgetEmail(
      {required String email}) async {
    try {
      return await ApiService.get("${ApiConstant.forgetEmail}/$email")
          .then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
