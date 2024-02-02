import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class UpdateProfileRepo {
  static Future updateProfile(
      {Map<String, dynamic>? body, String? images}) async {
    try {
      print(images);

      if (images != null) {
        return await ApiService.putMultiPart(
                ApiConstant.updateProfile, body!, [images],
                imagePathName: 'profileImage')
            .then((value) {
          log(value.toString());

          return value;
        });
      } else {
        return await ApiService.put(
          ApiConstant.updateProfile,
          body ?? {},
        ).then((value) {
          log("here is ${value.toString()}");
          return value;
        });
      }
    } catch (e) {
      rethrow;
    }
  }
}
