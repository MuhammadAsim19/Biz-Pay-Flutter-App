import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class BadgesRepo {
  static Future getBadges({String? type}) async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.get("${ApiConstant.allBadges}?type=${type ?? ''}",
            headers: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }

  static Future getBrokerOfBadges({String? badgeId}) async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.get("${ApiConstant.getExportFormBadges}$badgeId")
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }

  static Future sendBadgeRequest(
      {Map<String, dynamic>? data, String? path, String? userType}) async {
    var headers = {"authorization": " ${Data.app.token}"};
    return ApiService.postMultipart(ApiConstant.sendBadgeRequest, data!, [path],
            imagePathName: 'attachment', header: headers)
        .then((value) {
      return value;
    }).catchError((e) {
      throw e;
    });
  }

  static Future getAllBadgesRequests() async {
    var headers = {"authorization": " ${Data.app.token}"};
    return await ApiService.get(ApiConstant.getAllBadgesRequest,
            headers: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }
}
