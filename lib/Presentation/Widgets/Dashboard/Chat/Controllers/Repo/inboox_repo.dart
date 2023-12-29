import 'dart:io';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class InboxRepo {
  static late IO.Socket socket;

  initSocket(BuildContext context, storyId) {
    try {
      print("here");
      socket = IO.io("ws://${ApiConstant.socketBase}/?userid=$storyId", <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'cors': {'origin': '*'}


      });

      socket.connect();
      print(socket.opts);
      ///replace userIdValue with storyId

      socket.onConnect((_) {
        print('connected to websocket');
        //

      });
      socket.onDisconnect((data) => print("disconnect from web sockrt"));



      return 200;
    }
    on SocketException catch (e) {
      debugPrint(e.toString());
      debugPrint('Internet connection is down.');
      return 10;
    } on Exception catch (e) {
      debugPrint("error check $e");
      return 0;
    }
  }

  Future<Map<String, dynamic>> createBuissness(
      {required Map<String, dynamic> body}) async {
    try {
      print("baseeee urlll ${ApiConstant.createBusinessUrl}");
      return await ApiService.postJson(ApiConstant.createBusinessUrl, body).then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

}

