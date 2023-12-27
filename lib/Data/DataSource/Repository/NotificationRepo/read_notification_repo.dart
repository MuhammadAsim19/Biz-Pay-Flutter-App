import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class ReadNotification {
  static Future<Map<String, dynamic>> readNotification(String Id) async {
    try {
      return await ApiService.get("${ApiConstant.readNotification}/$Id")
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
