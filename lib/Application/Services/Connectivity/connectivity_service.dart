
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';

class AppConnectivity {
  static void connectionChanged(
      {void Function()? onDisconnected, void Function()? onConnected}) {
    Connectivity().onConnectivityChanged.listen((result) {
      log('CONNECTIVITY:$result');
      if (result == ConnectivityResult.none) {
        onDisconnected != null ? onDisconnected() : null;
      } else {
        onConnected != null ? onConnected() : null;
      }
    });
  }
}
