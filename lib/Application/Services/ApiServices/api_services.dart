import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

//import 'dart:ffi';

import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../Data/AppData/user_data.dart';

class ApiService {
  static Map<String, String> _authMiddleWare() {
    return {};
    // print(us);
    //
    // return us != null
    //     ? {
    //         "Authorization": "Bearer $us",
    //         //'Content-Type': 'application/x-www-form-urlencoded',
    //         //'Content-Type': 'application/json'
    //       }
    //     : {
    //         'Content-Type': 'application/json',
    //       };
  }

  static Future<Map<String, dynamic>> get(String url,
      {Map<String, String>? headers}) async {
    print("object");
    print(headers.toString());

    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {"Success": false, "error": res.body, "body": null};
    } on SocketException catch (e) {
      print('in socet');
      // Handle SocketException here.
      return {
        "Success": false,
        "error": 'No Internet Connection',
        "status": 30
      };
    } on TimeoutException catch (e) {
      return {"Success": false, "error": "Request Time Out", "status": 31};
    } on HttpException catch (e) {
      return {"Success": false, "error": "Invalid Request", "status": 32};
    } catch (e) {
      rethrow;
    }
  }

  // static getCat(String url, {Map<String, String>? header}) async {
  //   try {
  //     var request = http.Request('GET', Uri.parse(url));
  //
  //     request.headers.addAll(header ?? _authMiddleWare());
  //
  //     var response = await request.send().timeout(const Duration(seconds: 30));
  //
  //     if (response.statusCode == 200) {
  //       // print();
  //       return await response.stream.bytesToString();
  //     } else if (response.statusCode == 401) {
  //       print(response.reasonPhrase);
  //       return 401;
  //     }
  //   } on SocketException catch (e) {
  //     print('in socet');
  //     // Handle SocketException here.
  //     return {
  //       "success": false,
  //       "error": 'No Internet Connection',
  //       "status": 30
  //     };
  //
  //     print('SocketException: $e');
  //     // You can display an error message to the user or perform other actions.
  //   } on TimeoutException catch (e) {
  //     print('in timeout');
  //     // Handle SocketException here.
  //     return {"success": false, "error": "Time Out", "status": 31};
  //   } on HttpException catch (e) {
  //     // Handle HttpException (e.g., invalid URL) here.
  //     return {"success": false, "error": 'Invalid Request', "status": 32};
  //   } catch (e) {
  //     return Future.error(e);
  //   }
  // }

  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body,
      {Map<String, String>? header}) async {
    log(url);

    try {
      print("body in the repo ${body.toString()}");

      var data = jsonEncode(body);

      print(data.toString());

      http.Response res = await http
          .post(
            Uri.parse(url),
            headers: header ?? _authMiddleWare(),
            body: body,
          )
          .timeout(const Duration(seconds: 30));
      print("Response ${res.body}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "Success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": res.body
      };
    } on SocketException catch (e) {
      print('in socet');
      // Handle SocketException here.
      return {
        "Success": false,
        "error": 'No Internet Connection',
        "status": 30
      };

      print('SocketException: $e');
      // You can display an error message to the user or perform other actions.
    } on TimeoutException catch (e) {
      print('in timeout');
      // Handle SocketException here.
      return {"Success": false, "error": "Time Out", "status": 31};
    } on HttpException catch (e) {
      // Handle HttpException (e.g., invalid URL) here.
      return {"Success": false, "error": "Invalid", "status": 32};
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> postMultipart(
      String url, Map<String, dynamic> body, List<String?> filesPath,
      {Map<String, String>? header,
      String? requestMethod,
      String? imagePathName}) async {
    try {
      print("Here is body ${body.toString()}");

      print("here2");
      print(Data().user!.token);
      final headers = {'authorization': '${Data().user!.token}'};
      var request =
          http.MultipartRequest(requestMethod ?? 'POST', Uri.parse(url));
      // request.fields.addAll();

      for (var str in body.entries) {
        if (str.value != null) {
          print(str.value);
          if (str.value.runtimeType is bool || str.key.runtimeType is bool) {
            print("herewe");
            request.fields[str.key.toString()] = str.value.toString();
          } else {
            request.fields[str.key] = str.value;
          }
          print(str.key);
        }
      }

      request.headers.addAll(headers);
      for (String? e in filesPath) {
        //print(e);
        request.files.add(await http.MultipartFile.fromPath(
            imagePathName ?? 'profileImage', e!));
      }

      http.StreamedResponse res = await request.send();
      // print(res.statusCode.toString() +"status code");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode =
            jsonDecode(await res.stream.bytesToString());
        return decode;
      }

      return {
        "Success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } on SocketException catch (e) {
      print('in socet');
      // Handle SocketException here.
      return {
        "Success": false,
        "error": 'No Internet Connection',
        "status": 30
      };

      // You can display an error message to the user or perform other actions.
    } on TimeoutException catch (e) {
      print('in timeout');
      // Handle SocketException here.
      return {"Success": false, "error": "Time Out", "status": 31};
    } on HttpException catch (e) {
      // Handle HttpException (e.g., invalid URL) here.
      return {"Success": false, "error": "Invalid", "status": 32};
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> postMultipartWithDoc(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? header,
    String? requestMethod,
    String? imagePathName,
    List<String?>? filesPath,
    List<String?>? attachFiles,
  }) async {
    print("Here is image Data ${filesPath.toString()}");
    print("Here is files Data ${attachFiles.toString()}");

    try {
      print("here2");
      // //  UserData? us = SharedPrefs.getUserLoginData();
      //   print(us?.token);
      //   print(us?.user.id);
      // final headers = {'authorization': 'Bearer ${us!.token}'};
      var request =
          http.MultipartRequest(requestMethod ?? 'POST', Uri.parse(url));
      //request.fields.addAll(body);

      for (var str in body.entries) {
        if (str.value != null) {
          if (str.value.runtimeType is bool || str.key.runtimeType is bool) {
            print("herewe");
            request.fields[str.key.toString()] = str.value.toString();
          } else {
            request.fields[str.key] = str.value;
          }
          print(str.key);
        }
      }
      // request.fields.addEntries(body.entries);

      request.headers.addAll(header!);
      for (String? e in filesPath!) {
        print(e);
        request.files.add(
            await http.MultipartFile.fromPath(imagePathName ?? 'images', e!));
      }

      for (String? e in attachFiles!) {
        print(e);
        request.files
            .add(await http.MultipartFile.fromPath('attached_files', e!));
      }

      http.StreamedResponse res = await request.send();
      // print(res.statusCode.toString() +"status code");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode =
            jsonDecode(await res.stream.bytesToString());
        return decode;
      }

      return {
        "Success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } on SocketException catch (e) {
      print('in socet');
      // Handle SocketException here.
      return {
        "Success": false,
        "error": 'No Internet Connection',
        "status": 30
      };

      // You can display an error message to the user or perform other actions.
    } on TimeoutException catch (e) {
      print('in timeout');
      // Handle SocketException here.
      return {"Success": false, "error": "Time Out", "status": 31};
    } on HttpException catch (e) {
      // Handle HttpException (e.g., invalid URL) here.
      return {"Success": false, "error": "Invalid", "status": 32};
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> put(
      String url, Map<String, dynamic>? body,
      {Map<String, String>? headers}) async {
    try {
      //print(body);
      http.Response res = await http.put(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
        body: jsonEncode(body),
        //encoding: Encoding.getByName("application/x-www-form-urlencoded")
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "Success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<int> putPublic(String url, Map<String, dynamic>? body,
      {Map<String, String>? headers}) async {
    try {
      //print(body);
      http.Response res = await http.put(
        Uri.parse(url),
        // headers: headers ?? _authMiddleWare(),
        //body: jsonEncode(body),
        //encoding: Encoding.getByName("application/x-www-form-urlencoded")
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
      }

      return res.statusCode;
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> delete(String url, String id,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("$url/$id"),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {
        "Success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }
}
