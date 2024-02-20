import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:http/http.dart' as http;
//import 'package:cupertino_http/cupertino_http.dart' as c_http;

class ApiService {
  static Future<Map<String, dynamic>> get(String url,
      {Map<String, String>? headers}) async {
    log(url);
    log(headers.toString());

    try {

      http.Response res = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {"Success": false, "error": res.body, "body": null};
    } on SocketException catch (e) {
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

  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body,
      {Map<String, String>? header}) async {
    log(url);

    try {
      log("body in the repo ${body.toString()}");

      var data = jsonEncode(body);

      log(data.toString());

      http.Response res = await http
          .post(
            Uri.parse(url),
            headers: header,
            body: body,
          )
          .timeout(const Duration(seconds: 30));
      log("Response ${res.body}");
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

  static Future<Map<String, dynamic>> postJson(
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
            headers: header,
            body: data,
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

      print("here is Url$url");
      print(Data().token);
      final headers = {'authorization': '${Data().token}'};
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
      if (filesPath.isNotEmpty) {
        for (String? e in filesPath) {
          //print(e);
          request.files.add(await http.MultipartFile.fromPath(
              imagePathName ?? 'profileImage', e!));
        }
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
    String url,
    Map<String, dynamic>? body,
  ) async {
    final headers = {'authorization': '${Data().token}'};

    try {
      print("pa repo ka map $body");
      http.Response res = await http.put(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      print('>>>>>>>>>>>>>${res.body}');
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

  static Future<Map<String, dynamic>> putMultiPart(
      String url, Map<String, dynamic> body, List<String?> filesPath,
      {Map<String, String>? header,
      String? requestMethod,
      String? imagePathName}) async {
    try {
      print("Here is body ${body.toString()}");

      print("here is Url$url");
      print(Data().token);
      final headers = {'authorization': '${Data().token}'};
      var request =
          http.MultipartRequest(requestMethod ?? 'PUT', Uri.parse(url));
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
      if (filesPath.isNotEmpty) {
        for (String? e in filesPath) {
          //print(e);
          request.files.add(await http.MultipartFile.fromPath(
              imagePathName ?? 'profileImage', e!));
        }
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

  static Future<Map<String, dynamic>> delete(String url,
      {Map<String, String>? headers}) async {
    final headers = {'authorization': '${Data().token}'};

    try {
      http.Response res = await http.delete(
        Uri.parse(url),
        headers: headers,
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
      return {"Success": false, "error": e.message, "status": 31};
    } on HttpException catch (e) {
      // Handle HttpException (e.g., invalid URL) here.
      return {"Success": false, "error": e.message, "status": 32};
    } catch (e) {
      return Future.error(e);
    }
  }
}
