import 'dart:developer';
import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class SocialRepo {
  static Future<Map<String, dynamic>> socialLogin(
      Map<String, dynamic> data) async {
    try {
      // Map<String, dynamic> data = {
      //   "email": email,
      //   "name": name,
      //   "photoUrl": photoUrl ?? "",
      //   "type": type
      // };
      final headers = {'':""};
      return await ApiService.post(ApiConstant.socialLoginUrl, data,
              header: headers)
          .then((value) {
        log('value $value');
        return value;
      }).catchError((error) {
//print(error);
        throw error;
      });
    } catch (e) {
      //   print(e);
      rethrow;
    }
  }
}
