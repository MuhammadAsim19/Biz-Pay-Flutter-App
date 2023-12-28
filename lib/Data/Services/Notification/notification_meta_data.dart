import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_services.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:math' as dM;

class NotificationMetaData {
  void messagingInitiation() async {
    // String? fcmToken = await FirebaseMessaging.instance.getToken();
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.getNotificationSettings();
    // log('FCM Token:$fcmToken');
  }

  ///foreground Notification handler  stream is listen
  void foregroundNotificationHandler({BuildContext? context}) {
    FirebaseMessaging.onMessage.listen((e) async {
      final id = dM.Random().nextInt(2000);
      print("OnMessage ${e.notification!.title}");
      log("checking logs for messages on message ${e.messageId}  ${e.category}  ${e.from}  ${e.messageType}   ${e.contentAvailable}  data  ${e.data.entries}  title: ${e.ttl}");
      //print();

      // NotificationServices().showNotification(
      //   id,
      //   e.notification!.title!,
      //   e.notification!.body!,
      // );

      // handleMessage(e,context: context);
    }).onError((error) {
      print("checking logs $error");
    });
  }

  ///backgroundNotification when tap this function will be called'' By background it means the resume state of android/iOS LIFECYCLE
  void backgroundNotificationOnTapHandler({BuildContext? context}) {
    FirebaseMessaging.onMessageOpenedApp.listen((e) async {
      var data = e.notification!.title;
      // handleMessage(e, context: NotificationMetaServices.context);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => NotificationScreen(guest: false),
      //   ),
      // );
    });
  }

  ///from terminated state opening
  void terminatedFromOnTapStateHandler(
      {BuildContext? context, String? payLoadData}) {
    if (payLoadData != null) {
      // handleMessage(!,context: context);
      // if(context!.mounted) {
      //   if(remoteMessageCheck.value?.notification?.title != null) {
      //     CustomDialog.dialog(context, Center(child: Text("From Terminated ${remoteMessageCheck.value?.notification!.title}"),));
      //   }
      // }
    }
  }

  ///HANDLING THE REMOTE MESSAGE FOR NAVIGATION
  void handleMessage(RemoteMessage message, {BuildContext? context}) {
    //print(message.data['info']);
    if (message.notification != null) {
      String payloadData = message.data['info'].toString();
    }
    // if (message.data['type'] == 'chat') {
    //   // Navigator.pushNamed(context, '/chat',
    //   //   arguments: ChatArguments(message),
    //   // );
    // }
  }

  ///handling notification from foreground
  notificationPayload(
    BuildContext context,
  ) {}
}
