import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class DeleteAccountRepo {
  static Future deleteAccount() async {
    log("repo called");
    return await ApiService.delete(ApiConstant.deleteAccount);
  }
}
