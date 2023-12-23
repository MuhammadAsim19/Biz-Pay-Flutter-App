import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class ChangePassword {
  changePassword(Map<String, dynamic> body) async {
    try {
      return await ApiService.put(
        ApiConstant.changePassword,
        body,
      );
    } catch (e) {
      print(Future.error(e));
      rethrow;
    }
  }
}
