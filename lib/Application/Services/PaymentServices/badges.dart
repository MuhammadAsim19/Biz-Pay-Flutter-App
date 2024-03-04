import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class AppBadges {
  static Future getAppBadges() async {
    final headers = {'authorization': '${Data().token}'};

    return await ApiService.get(ApiConstant.allBadges, headers: headers)
        .then((value) {
      log("Here is Badges $value");
      return value;
    }).catchError((e) {
      throw e;
    });
  }
}
