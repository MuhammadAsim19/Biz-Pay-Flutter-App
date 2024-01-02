import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseServices {
  static Future<String> getFcm() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print("fcm token device");

    log(fcmToken!);
    return fcmToken;
  }
}
