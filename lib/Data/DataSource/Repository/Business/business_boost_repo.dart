import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class BusinessBoostRepo {
  static Future getBoostPackages() async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.get(ApiConstant.allBoostPackages, headers: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }

  static Future activeBoostPackage(
      {required String planId, required String businessId}) async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.post(
            ApiConstant.activateBoost,
            {
              "planId": planId,
              "businessId": businessId,
            },
            header: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }
}
