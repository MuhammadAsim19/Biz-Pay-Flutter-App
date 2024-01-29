import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class AgreeToPrivacyAndTerms {
  static ValueNotifier<bool> agree = ValueNotifier(false);

  static Future<Map<String, dynamic>> agreeToPrivacy({String? version}) async {
    try {
      var body = {"version": "1.1.1.2"};

      return await ApiService.put(ApiConstant.agreeToPrivacy, body)
          .then((value) {
        log("$value");

        if (value['Success']) {
          agree.value = true;
          agree.notifyListeners();
        } else {
          agree.value = false;
          agree.notifyListeners();
        }
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
