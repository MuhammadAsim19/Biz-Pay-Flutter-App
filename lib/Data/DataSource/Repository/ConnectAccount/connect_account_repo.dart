import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class ConnectAccountRepo {
  static Future getOnboardingUrl() async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.get(ApiConstant.getExpertOnboarding,
            headers: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }

  static Future verifyOboarding() async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.get(ApiConstant.verifyOnboarding, headers: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }

  static Future showBalance() async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.get(ApiConstant.expertBalance, headers: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }

  static Future withdrawBalance({required String amount}) async {
    var headers = {"authorization": " ${Data.app.token}"};
    log("Here   " + {'amount': amount}.toString());
    return await ApiService.post(
            ApiConstant.withdrawBalance, {'amount': amount}, header: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }
}
