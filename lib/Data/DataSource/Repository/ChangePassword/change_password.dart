import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class ChangePassword {
  changePassword(Map<String, dynamic> body) async {
    var headers = {"authorization": " ${Data.app.user!.token}"};

    try {
      return await ApiService.put(ApiConstant.changePassword, body,
          headers: headers);
    } catch (e) {
      print(Future.error(e));
      rethrow;
    }
  }
}
