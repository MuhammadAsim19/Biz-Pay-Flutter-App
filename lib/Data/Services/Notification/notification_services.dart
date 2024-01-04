import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final NotificationServices _notificationService =
      NotificationServices._internal();

  factory NotificationServices() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationServices._internal();

  Future<void> permission() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<void> initNotification() async {
    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios initialization
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    // the initialization settings are initialized after they are set
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (res) {
        print("pa notification service ka dana ${res.payload}");

        PayloadStream.instance.payload.sink.add(res.payload ?? 'Default');
      },
    );
  }

  Future<void> showNotification(
    int id,
    String title,
    String body, {
    String? payload,
  }) async {
    print("called$id");
    // tz.initializeTimeZones();
    // String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    // tz.Location loc = tz.getLocation(currentTimeZone);
    // tz.setLocalLocation(loc);
    // var currentDateTime =
    //     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 2));
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      payload: payload,
      const NotificationDetails(
        // Android details
        android: AndroidNotificationDetails(
          'main_channel', 'Main Channel',
          channelDescription: "Shampo",
          // icon: Assets.appLogo,

          importance: Importance.max,
          priority: Priority.max,
          //       styleInformation: BigPictureStyleInformation(
          //       //  FilePathAndroidBitmap(Assets.appLogo),
          //  // largeIcon: FilePathAndroidBitmap(Assets.appLogo),
          // ),
        ),
        // iOS details
        iOS: DarwinNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),

      // Type of time interpretation
      // uiLocalNotificationDateInterpretation:
      //     UILocalNotificationDateInterpretation.absoluteTime,
      // androidAllowWhileIdle:
      //     true, // To show notification even when the app is closed
    );
  }

// Future<Map> sendFCMTokenAndDeviceId({required bool isVendor}) async {
//   String? fcmToken = await FirebaseMessaging.instance.getToken();
//   AuthenticationModel data =
//   await SharedPref.geLocalAuthCredentials(isVendor: isVendor);
//   String? deviceId = await UniqueDeviceId.instance.getUniqueId();
//   String token = data.body!.token!;
//   String myUrl = "$baseUrl/create/or/update_fcm";
//   http.Response response = await http.post(Uri.parse(myUrl), headers: {
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token'
//   }, body: {
//     'fcm_token': fcmToken,
//     'device_id': deviceId,
//   });
//   log('FCM Token: ${response.body}');
//   return jsonDecode(response.body);
// }
//
// Future<Map> clearDeviceFCM({bool isVendor = false}) async {
//   AuthenticationModel data =
//   await SharedPref.geLocalAuthCredentials(isVendor: isVendor);
//   String? deviceId = await UniqueDeviceId.instance.getUniqueId();
//   String token = data.body!.token!;
//   String myUrl = "$baseUrl/clear_fcm";
//   http.Response response = await http.post(Uri.parse(myUrl), headers: {
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token'
//   }, body: {
//     'device_id': deviceId,
//   });
//   log('FCM Token: ${response.body}');
//   return jsonDecode(response.body);
// }

// Future<Map<String, dynamic>> getNotifications(bool isVendor) async {
//   AuthenticationModel data =
//   await SharedPref.geLocalAuthCredentials(isVendor: isVendor);
//   String token = data.body!.token!;
//   String myUrl = "$baseUrl/my/notifications";
//   log('Token: $token');
//
//   http.Response response = await http.get(
//     Uri.parse(myUrl),
//     headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
//   );
//   log('Notifications: ${response.body}');
//   return {'code': response.statusCode, 'data': jsonDecode(response.body)};
// }

// Future<Map<String, dynamic>> marketingNotificationStatus(bool status) async {
//   AuthenticationModel data =
//   await SharedPref.geLocalAuthCredentials(isVendor: false);
//   String token = data.body!.token!;
//   String myUrl = "$baseUrl/change/marketing/notification/status";
//   // log('Token: $token');
//
//   http.Response response = await http.post(Uri.parse(myUrl), headers: {
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   }, body: {
//     'status': status ? '1' : '0'
//   });
//   if (response.statusCode == 200) {
//     return jsonDecode(response.body);
//   } else {
//     return {
//       "success": false,
//       "error": 'Server error ${response.statusCode}',
//       "body": null
//     };
//   }
// }

// Future<Map<String, dynamic>> simpleNotificationStatus(bool status) async {
//   AuthenticationModel data =
//   await SharedPref.geLocalAuthCredentials(isVendor: false);
//   String token = data.body!.token!;
//   String myUrl = "$baseUrl/change/status/notification";
//   // log('Token: $token');
//
//   http.Response response = await http.post(Uri.parse(myUrl), headers: {
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   }, body: {
//     'status': status ? '1' : '0'
//   });
//   if (response.statusCode == 200) {
//     return jsonDecode(response.body);
//   } else {
//     return {
//       "success": false,
//       "error": 'Server error ${response.statusCode}',
//       "body": null
//     };
//   }
// }

// Future<Map<String, dynamic>> getNotificationStatus() async {
//   AuthenticationModel data =
//   await SharedPref.geLocalAuthCredentials(isVendor: false);
//   String token = data.body!.token!;
//   String myUrl = "$baseUrl/notifications/status";
//   // log('Token: $token');
//
//   http.Response response = await http.get(
//     Uri.parse(myUrl),
//     headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     },
//   );
//   if (response.statusCode == 200) {
//     return jsonDecode(response.body);
//   } else {
//     return {
//       "success": false,
//       "error": 'Server error ${response.statusCode} ${response.reasonPhrase}',
//       "body": null
//     };
//   }
// }
}

class PayloadStream {
  static final PayloadStream instance = PayloadStream();

  final payload = StreamController<String>.broadcast();

  Stream<String> get getPayload => payload.stream;
}
