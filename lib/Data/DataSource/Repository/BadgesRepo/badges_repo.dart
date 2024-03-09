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

    return await ApiService.get("${ApiConstant.getExportFormBadges}$badgeId",
            headers: headers)
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

  static Future getAllBadgesRequests({bool? isBroker}) async {
    var headers = {"authorization": " ${Data.app.token}"};
    return await ApiService.get(
            isBroker == true
                ? ApiConstant.getBrokerBadgeRequest
                : ApiConstant.getUserBadgeRequest,
            headers: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) {
      log(error.toString());
      return {"Success": false, "error": error.toString()};
    });
  }

  static Future addBadgeDelivery(
      {Map<String, dynamic>? data, String? path}) async {
    var headers = {"authorization": " ${Data.app.token}"};
    return ApiService.putMultiPart(ApiConstant.addBadgeDelivery, data!, [path],
            imagePathName: 'attachment', header: headers)
        .then((value) {
      return value;
    }).catchError((e) {
      throw e;
    });
  }

  static Future acceptORRejectRequest(
      {String? status, String? requestID}) async {
    var headers = {"authorization": " ${Data.app.token}"};
    return ApiService.get(
            "${ApiConstant.acceptRejectDelivery}$status/$requestID",
            headers: headers)
        .then((value) {
      return value;
    }).catchError((e) {
      throw e;
    });
  }

  static Future requestBadgeView({required String badgeId}) async {
    var headers = {"authorization": " ${Data.app.token}"};
    return await ApiService.get("${ApiConstant.requestBadgeView}/$badgeId",
            headers: headers)
        .then((value) {
      log(value.toString());
      return value;
    }).onError((error, stackTrace) {
      log(error.toString());
      return {"Success": false, "error": error.toString()};
    });
  }

  //
}
