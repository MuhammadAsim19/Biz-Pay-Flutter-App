import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class DeleteBusiness {
  static Future deleteBusiness({String? businessId}) async {
    return await ApiService.delete("${ApiConstant.deleteBusiness}/$businessId")
        .then((value) {
      log(value.toString());

      return value;
    });
  }
}
