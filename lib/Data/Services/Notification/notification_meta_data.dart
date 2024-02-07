import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_services.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BrokerProfile/broker_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/broker_chat_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';
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
  void foregroundNotificationHandler() {
    FirebaseMessaging.onMessage.listen((e) {
      final id = dM.Random().nextInt(2000);
      print("OnMessage ${e.notification!.title}");
      log("checking logs for messages on message ${e.messageId}  ${e.category}  ${e.from}  ${e.messageType}   ${e.contentAvailable}  data  ${e.data.entries}  title: ${e.ttl}");
      //print();
    if(e.data['click_action']=='NEW_MESSEGE_TO_BUSIENSS_CHAT' ||  e.data['click_action']=='NEW_MESSEGE_TO_BROKER_CHAT'){}
    else
      {
      NotificationServices().showNotification(
          id, e.notification!.title!, e.notification!.body!,
          payload: jsonEncode(e.data));
      }
    }).onError((error) {
      print("checking logs $error");
    });
  }

  ///backgroundNotification when tap this function will be called'' By background it means the resume state of android/iOS LIFECYCLE
  void backgroundNotificationOnTapHandler() {
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
  void handleMessage(String action, var info, {BuildContext? context}) {
    //print(message.data['info']);
    // if (message.notification != null) {
    //   String payloadData = message.data['info'].toString();
    //
    //   print(payloadData.toString());
    // }

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
        } else {
          WidgetFunctions.instance.snackBar(context!, text: 'In Notification ');
        }
      }
    } else {}
  }

  ///handling notification from foreground
  notificationPayload(
    BuildContext context,
  ) {
    PayloadStream.instance.getPayload.listen((event) {
      Map<String, dynamic> data = jsonDecode(event);
      if (data['title'] != null) {
        print(data['click_action']);
        handleMessage(data['click_action'], data['info'], context: context);
      }
      // Navigate.to(context, Notifications());
    });
  }

  handelNavigation(BuildContext? context, String navigateTo, var info,{bool? isFromTerminated}) {
    print("here is the action${navigateTo}");

    // List<Map<String, Widget>> navigationScreen = [
    //   {
    //     'NEW_BUSINESS_CREATED': BusinessDetails(
    //       isFromNotification: true,
    //       id: info,
    //     )
    //   },
    //   {'': const Notifications()},
    //   {
    //     'BUSINES_UPDATED': BusinessDetails(
    //       id: info,
    //     )
    //   },
    //   {
    //     'BUSINES_CHAT_STARTED': const BottomNavigationScreen(
    //       initialPage: 2,
    //     )
    //   },
    //   {
    //     'BROKER_CREATED': BrokerProfile(
    //       id: info,
    //     )
    //   },
    //   {
    //     'NEW_MESSEGE_TO_BUSIENSS_CHAT': ChatDetailsScreen(
    //       chatDto: ChatTileApiModel.fromRawJson(info),
    //     )
    //   },
    //   {
    //     'NEW_MESSEGE_TO_BROKER_CHAT': BrokerChatDetailsScreen(
    //       chatDto: ChatTileApiModel.fromRawJson(info),
    //     )
    //   },
    //   {
    //     'BROKER_CHAT_STARTED': const BottomNavigationScreen(
    //       initialPage: 2,
    //     )
    //   },
    // ];

    if (context != null) {
      print('here is business id$info');

      switch (navigateTo) {
        case "NEW_BUSINESS_CREATED":
          _navigate(
              context,
              BusinessDetails(
                isFromNotification: true,
                id: info,
              ));
        case "BUSINES_UPDATED":
          _navigate(
              context,
              BusinessDetails(
                id: info,
              ));

        case 'BUSINES_CHAT_STARTED':
          const BottomNavigationScreen(
            initialPage: 2,
          );
        case 'NEW_MESSEGE_TO_BROKER_CHAT':

          if(isFromTerminated!=null) {
            InboxRepo().initSocket(context, Data().user?.user?.id);
          }
          _navigate(
              context,
              BrokerChatDetailsScreen(
                chatDto: ChatTileApiModel.fromRawJson(info),
              ));

        case 'NEW_MESSEGE_TO_BUSIENSS_CHAT':
          if(isFromTerminated!=null) {
            InboxRepo().initSocket(context, Data().user?.user?.id);
          }

          _navigate(
              context,
              ChatDetailsScreen(
                chatDto: ChatTileApiModel.fromRawJson(info),
              ));
        case 'BROKER_PROFILE_CREATED':
          _navigate(
              context,
              BrokerProfile(
                id: info,
              ));

        default:
          // Handle unknown navigateTo values, maybe return a default screen or throw an error.
          _navigate(context,
              const Notifications()); // Or throw an error, depending on your requirements.
      }

      // for (Map<String, Widget> i in navigationScreen) {
      //   print("here is i${i}");
      //
      //   if (i.containsKey(navigateTo)) {
      //     print(navigateTo);

      //   }
      // }
    } else {
      print('context not found');
    }
  }

  _navigate(BuildContext context, Widget navigation) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return navigation;
      },
    ));
  }
}
