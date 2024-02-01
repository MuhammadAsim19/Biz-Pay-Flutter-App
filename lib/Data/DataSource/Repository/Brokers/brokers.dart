import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class BrokersData {
  static Future<Map<String, dynamic>> brokerData({String? brokerId}) async {
    String apiUrl = brokerId == null
        ? ApiConstant.brokerList
        : "${ApiConstant.brokerById}/$brokerId";

    final headers = {'authorization': '${Data().token}'};

    return await ApiService.get(apiUrl, headers: headers);
  }

  static Future<Map<String, dynamic>> switchToBroker(
      {required Map<String, dynamic> body, String? imagePath}) async {
    List<String?> images = imagePath != null ? [imagePath] : [];

    return await ApiService.postMultipart(
      ApiConstant.switchTOBroker,
      body,
      images,
    ).then((value) {
      return value;
    });
  }
}
