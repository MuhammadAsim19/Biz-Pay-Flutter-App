import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class VerifyOtp {
  static Future<Map<String, dynamic>> verifyOtp(
      {required String otp,
      required String userID,
      required bool isFromSignUp}) async {
    var body = {
      "id": userID,
      "OTPCODE": otp,
    };
    try {
      return await ApiService.post(
              isFromSignUp
                  ? ApiConstant.registerVerifyOtp
                  : ApiConstant.verifyOtp,
              body)
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
