import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_services.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BrokerProfile/broker_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:math' as dM;

class NotificationMetaData {
  static ValueNotifier<String?> remoteMessageCheck = ValueNotifier(null);
  static ValueNotifier<String?> routeNotifier = ValueNotifier(null);
  static BuildContext? servicesContext;

  void setContext(BuildContext context) {
    servicesContext = context;
  }

  void messagingInitiation() async {
    // String? fcmToken = await FirebaseMessaging.instance.getToken();
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.getNotificationSettings();
    // log('FCM Token:$fcmToken');
  }

  ///foreground Notification handler  stream is listen
  void foregroundNotificationHandler({BuildContext? context}) {
    FirebaseMessaging.onMessage.listen((e) {
      final id = dM.Random().nextInt(2000);
      print("OnMessage ${e.notification!.title}");
      log("checking logs for messages on message ${e.messageId}  ${e.category}  ${e.from}  ${e.messageType}   ${e.contentAvailable}  data  ${e.data.entries}  title: ${e.ttl}");
      //print();

      NotificationServices().showNotification(
          id, e.notification!.title!, e.notification!.body!,
          payload: jsonEncode(e.data));
    }).onError((error) {
      print("checking logs $error");
    });
  }

  ///backgroundNotification when tap this function will be called'' By background it means the resume state of android/iOS LIFECYCLE
  void backgroundNotificationOnTapHandler({BuildContext? context}) {
    FirebaseMessaging.onMessageOpenedApp.listen((e) async {
      var data = e.notification!.title;
      handleMessage(e.data['click_action'], e.data['info'],
          context: NotificationMetaData.servicesContext);
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
      {BuildContext? context, RemoteMessage? payLoadData}) {
    if (payLoadData != null) {
      if (payLoadData.notification != null) {
        handleMessage(
            payLoadData.data['click_action'], payLoadData.data['info'],
            context: NotificationMetaData.servicesContext);
      }
    }
  }

  ///HANDLING THE REMOTE MESSAGE FOR NAVIGATION
  void handleMessage(String action, String info, {BuildContext? context}) {
    //print(message.data['info']);
    // if (message.notification != null) {
    //   String payloadData = message.data['info'].toString();
    //
    //   print(payloadData.toString());
    // }

    print('here is the data of notifications ');

    if (Data.app.token != null) {
      if (action != '') {
        handelNavigation(context, action, info);
      } else {
        if (routeNotifier.value != 'Notification') {
          print('action is null the notification screen called');

          Navigator.push(context!, MaterialPageRoute(
            builder: (context) {
              return const Notifications();
            },
          ));
        }
      }
    } else {}
  }

  ///handling notification from foreground
  notificationPayload(
    BuildContext context,
  ) {
    PayloadStream.instance.getPayload.listen((event) {
      var data = jsonDecode(event);
      if (data['title'] != null) {
        handleMessage(data['click_action'], data['info'], context: context);
      }
      // Navigate.to(context, Notifications());
    });
  }

  handelNavigation(BuildContext? context, String navigateTo, var info) {
    List<Map<String, Widget>> navigationScreen = [
      {
        'BUSINES_CREATED': BusinessDetails(
          isFromNotification: true,
          id: info,
        )
      },
      {'': const Notifications()},
      {
        'BUSINES_UPDATED': BusinessDetails(
          id: info,
        )
      },
      {
        'BUSINES_CHAT_STARTED': const BottomNavigationScreen(
          initialPage: 2,
        )
      },
      {'NEW_MESSEGE_TO_BUSIENSS_CHAT': ChatDetailsScreen()},
      {
        'BROKER_CREATED': BrokerProfile(
          id: info,
        )
      },
      {
        'BROKER_CHAT_STARTED': const BottomNavigationScreen(
          initialPage: 2,
        )
      },
    ];

    if (context != null) {
      for (Map<String, Widget> i in navigationScreen) {
        if (i.containsKey(navigateTo)) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return i[navigateTo]!;
            },
          ));
        }
      }
    } else {
      print('context not found');
    }
  }
}
