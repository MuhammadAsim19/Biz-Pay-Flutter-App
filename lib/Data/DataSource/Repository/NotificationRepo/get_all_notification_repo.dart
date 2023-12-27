import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';

import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class GetAllNotificationRepo {
  static Future<Map<String, dynamic>> getAllNotificationData() async {
    var token = {"authorization": " ${Data.app.token!}"};
    try {
      return await ApiService.get(
              headers: token, ApiConstant.getAllNotification)
          .then((value) {
        return value;
      }).catchError((exception) {
        throw exception;
      });
    } catch (exception) {
      rethrow;
    }
  }
}
