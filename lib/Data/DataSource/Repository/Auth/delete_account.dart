import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class DeleteAccountRepo {
  static Future deleteAccount() async {
    return await ApiService.delete(ApiConstant.deleteAccount);
  }
}
