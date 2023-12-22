import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class BrokersData {
  static Future<Map<String, dynamic>> brokerData() async {
    return await ApiService.get(ApiConstant.brokerList);
  }

  static Future<Map<String, dynamic>> switchToBroker(
      {required Map<String, dynamic> body, required String imagePath}) async {
    return await ApiService.postMultipart(
        ApiConstant.switchTOBroker, body, [imagePath]).then((value) {
      return value;
    });
  }
}
