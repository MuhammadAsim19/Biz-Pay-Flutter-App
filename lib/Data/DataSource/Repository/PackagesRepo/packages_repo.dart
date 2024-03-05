import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class PackageRepo {
  static getPackages() async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.get(ApiConstant.allPackages, headers: headers).then(
        (value) {
      log(value.toString());
      return value;
    }).onError(
        (error, stackTrace) => {"Success": false, "error": error.toString()});
  }
}
