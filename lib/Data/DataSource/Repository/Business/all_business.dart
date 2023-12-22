import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class AllBusiness {
  static Future<Map<String, dynamic>> getBusiness() async {
    return await ApiService.get(ApiConstant.getAllBusiness);
  }

  static Future<Map<String, dynamic>> onlineBusiness() async {
    return await ApiService.get(ApiConstant.getAllBusiness);
  }

  static Future<Map<String, dynamic>> recentlyAdded() async {
    return await ApiService.get(ApiConstant.recentlyAddedBusiness);
  }

  static Future<Map<String, dynamic>> inWishlist(String bussinessId) async {
    var headers = {"Authorization": " ${Data.app.user!.token}"};

    try {
      return await ApiService.get(
              headers: headers,
              "${ApiConstant.checkBusinessesWishlist}/$bussinessId")
          .then((value) {
        log(value.toString());
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getBusinessCetegory() async {
    return await ApiService.get(ApiConstant.getAllCateg);
  }

  static Future<Map<String, dynamic>> recentlyView() async {
    var headers = {"Authorization": " ${Data.app.user!.token}"};

    try {
      return await ApiService.get(
        headers: headers,
        ApiConstant.recentlyViewBusiness,
      ).then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> wishlistCheck(
      String bussinessId, bool operation) async {
    var headers = {"Authorization": " ${Data.app.user!.token}"};

    try {
      String operations = !operation ? "ADD" : "REMOVE";
      log(operations);
      return await ApiService.get(
              headers: headers,
              "${ApiConstant.toggleWishlist}/$bussinessId/$operations")
          .then((value) {
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
