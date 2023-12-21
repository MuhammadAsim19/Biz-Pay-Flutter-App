import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';

import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class WishlistRepo {
  static Future<Map<String, dynamic>> wishlistData() async {
    var headers = {"Authorization": " ${Data.app.user!.token}"};

    try {
      return await ApiService.get(
        headers: headers,
        ApiConstant.wishList,
      ).then((value) {
        log(value.toString());
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
