import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class BadgesRepo {
  static Future getBadges() async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.get(ApiConstant.appBadges, headers: headers).then(
        (value) {
      log(value.toString());
      return value;
    }).onError(
        (error, stackTrace) => {"Success": false, "error": error.toString()});
  }
}
