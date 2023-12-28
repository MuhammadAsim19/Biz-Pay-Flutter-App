import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class ReadNotification {
  static Future<Map<String, dynamic>> readNotification(String Id) async {
    var headers = {"authorization": " ${Data.app.token}"};

    try {
      return await ApiService.get("${ApiConstant.readNotification}/$Id",
              headers: headers)
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
