import 'dart:io';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class InboxRepo {
  static IO.Socket? socket;
  static ValueNotifier<bool> isConnected = ValueNotifier(false);

  initSocket(BuildContext context, storyId) {
    try {
      print("here");
      socket = IO.io(
          "ws://${ApiConstant.socketBase}/?userid=$storyId", <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'cors': {'origin': '*'}
      });

      socket?.connect();
      print(socket?.opts);

      ///replace userIdValue with storyId

      socket?.onConnect((_) {
        print('connected to websocket');
        isConnected.value = true;
        isConnected.notifyListeners();
        //
      });
      socket?.onDisconnect((data) {
        print("Disconnectd from web socket");
        isConnected.value = false;
        isConnected.notifyListeners();
      });

      return 200;
    } on SocketException catch (e) {
      debugPrint(e.toString());
      debugPrint('Internet connection is down.');
      return 10;
    } on Exception catch (e) {
      debugPrint("error check $e");
      return 0;
    }
  }

  Future<Map<String, dynamic>> createBusiness(
      {required Map<String, dynamic> body}) async {
    try {
      print("base crlf ${ApiConstant.createBusinessChatUrl}");
      final headers = {'authorization': '${Data().token}'};
      print(headers);
      return await ApiService.post(ApiConstant.createBusinessChatUrl, body,header: headers)
          .then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createBrokerChat(
      {required Map<String, dynamic> body}) async {
    try {
      print("base crlf ${ApiConstant.createBrokerChatUrl}");
      final headers = {'authorization': '${Data().token}'};
      print(headers);
      return await ApiService.post(ApiConstant.createBrokerChatUrl, body,header: headers)
          .then((value) {
        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
