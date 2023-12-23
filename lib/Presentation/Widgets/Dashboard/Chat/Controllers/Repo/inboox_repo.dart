import 'dart:io';

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
}

class ApiConstant{


  static  String baseUrl="http://192.168.1.5:9000";
  static String socketBase="192.168.1.5:9000";

}