import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';

class AddBusiness {
  Future addBusiness(
      {required Map<String, dynamic> body,
      List<String?>? images,
      List<String?>? attachFiles}) async {
    var headers = {"authorization": " ${Data.app.token}"};

    print(images.toString());
    print(attachFiles.toString());

    return await ApiService.postMultipartWithDoc(ApiConstant.addBusiness, body,
            header: headers,
            imagePathName: 'images',
            filesPath: images,
            attachFiles: attachFiles)
        .then((value) {
      log(value.toString());

      return value;
    });
  }
}
