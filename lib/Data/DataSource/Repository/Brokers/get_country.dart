import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class GetCountry {
  static Future<Map<String, dynamic>> getCountryList() async {
    return await ApiService.get(ApiConstant.allCountry);
  }

  static Future<Map<String, dynamic>> getCountryStates(
      String countryName, bool city) async {
    String apiUrl =
        city != true ? ApiConstant.stateOfCountry : ApiConstant.stateCity;

    print(apiUrl);

    return await ApiService.get("$apiUrl/$countryName");
  }
}
