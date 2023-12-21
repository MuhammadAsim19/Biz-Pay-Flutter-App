import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class AddBusiness {
  Future addBusiness({required Map<String, dynamic> body}) async {
    var headers = {"Authorization": " ${Data.app.user!.token}"};
    return await ApiService.post(ApiConstant.addBusiness, body, header: headers)
        .then((value) {
      return value;
    });
  }
}
