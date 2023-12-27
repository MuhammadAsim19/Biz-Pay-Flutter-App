import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';

import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class PrivacyPolicyRepo {
  static Future<Map<String, dynamic>> privacyPolicyData() async {
    try {
      return await ApiService.get(
        ApiConstant.privacyPolicy,
      ).then((value) {
        log(value.toString());
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
