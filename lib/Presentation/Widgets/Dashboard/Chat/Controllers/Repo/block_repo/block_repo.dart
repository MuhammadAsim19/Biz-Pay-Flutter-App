import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class BlockRepo {
  Future<Map<String, dynamic>> blockUser(
      {required Map<String, dynamic> body}) async {
    try {
      print("baseeee urlll ${ApiConstant.blockUser}");
      return await ApiService.postJson(ApiConstant.blockUser, body).then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}