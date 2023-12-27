import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class CategoryBusiness {
  static Future<Map<String, dynamic>> getCategoryBusiness(String catId) async {
    try {
      return await ApiService.get("${ApiConstant.categoryBusiness}/$catId")
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
