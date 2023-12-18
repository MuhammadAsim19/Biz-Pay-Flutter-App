import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class AllBusiness {
  static Future<Map<String, dynamic>> getBusiness() async {
    try {
      return await ApiService.get(ApiConstant.getAllBusiness).then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> recentlyAdded() async {
    try {
      return await ApiService.get(ApiConstant.recentlyAddedBusiness)
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
