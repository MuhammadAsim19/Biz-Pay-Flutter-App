import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class GetCountry {
  static Future<Map<String, dynamic>> getCountryList() async {
    return await ApiService.get(ApiConstant.allCountry);
  }

  static Future<Map<String, dynamic>> getCountryStates(
      String countryName) async {
    return await ApiService.get("${ApiConstant.allCountry}/$countryName");
  }
}
