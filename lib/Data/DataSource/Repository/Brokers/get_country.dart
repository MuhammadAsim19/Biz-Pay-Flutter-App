import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class GetCountry {
  static Future<Map<String, dynamic>> getCountryList() async {
    return await ApiService.get(ApiConstant.allCountry);
  }

  static Future<Map<String, dynamic>> getCountryStates(
      String countryName, String? state, bool city) async {
    print(state);

    String apiUrl = state == null
        ? ApiConstant.allCountry
        : "${ApiConstant.stateOfCountry}/$countryName";

    String url =
        city == true ? "${ApiConstant.stateCity}/$countryName/$state" : apiUrl;

    print(url.toString());

    return await ApiService.get(url);
  }
}
