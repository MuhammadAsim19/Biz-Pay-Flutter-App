import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class BrokersData {
  static Future<Map<String, dynamic>> brokerData() async {
    return await ApiService.get(ApiConstant.brokerList);
  }
}
