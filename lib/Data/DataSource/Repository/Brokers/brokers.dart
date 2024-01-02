import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class BrokersData {
  static Future<Map<String, dynamic>> brokerData({String? brokerId}) async {
    String apiUrl = brokerId == null
        ? ApiConstant.brokerList
        : "${ApiConstant.brokerById}/$brokerId";
    return await ApiService.get(apiUrl);
  }

  static Future<Map<String, dynamic>> switchToBroker(
      {required Map<String, dynamic> body, required String imagePath}) async {
    return await ApiService.postMultipart(
        ApiConstant.switchTOBroker, body, [imagePath]).then((value) {
      return value;
    });
  }
}
