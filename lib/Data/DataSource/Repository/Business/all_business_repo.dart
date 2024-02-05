import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class AllBusiness {
  static var headers = {"Authorization": " ${Data.app.token}"};

  static Future<Map<String, dynamic>> getBusiness({String? id}) async {
    String apiUrl = id == null
        ? ApiConstant.getAllBusiness
        : "${ApiConstant.getBusinessById}/$id";
    return await ApiService.get(apiUrl, headers: headers);
  }

  static Future<Map<String, dynamic>> onlineBusiness() async {
    return await ApiService.get(ApiConstant.getAllBusiness, headers: headers);
  }

  static Future<Map<String, dynamic>> recentlyAdded() async {
    var headers = {"Authorization": " ${Data.app.token}"};

    return await ApiService.get(ApiConstant.recentlyAddedBusiness,
        headers: headers);
  }

  static Future<Map<String, dynamic>> yourBusinessList() async {
    var headers = {"Authorization": " ${Data.app.token}"};

    return await ApiService.get(ApiConstant.userBusiness, headers: headers);
  }

  static Future<Map<String, dynamic>> addToRecentlyView(
      String businessID) async {
    print("Here is Token${Data.app.token}");
    print("Here is Token${Data.app.user!.user!.email}");

    var headers = {"Authorization": " ${Data.app.token}"};

    return await ApiService.get(
        headers: headers, "${ApiConstant.addToRecentlyViewed}/$businessID");
  }

  static Future<Map<String, dynamic>> inWishlist(String bussinessId) async {
    var headers = {"Authorization": " ${Data.app.token}"};

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
    var headers = {"Authorization": " ${Data.app.token}"};

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
    var headers = {"Authorization": " ${Data.app.token}"};

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

  /// to update your business
  static Future<Map<String, dynamic>> updateBusiness(
      {Map<String, dynamic>? body,
      String? businessId,
      List<String?>? images}) async {
    try {
      return await ApiService.putMultiPart(
              "${ApiConstant.updateBusiness}/$businessId", body!, images ?? [],
              imagePathName: 'images')
          .then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
