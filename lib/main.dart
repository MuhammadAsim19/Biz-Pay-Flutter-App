import 'dart:developer';
import 'package:buysellbiz/Data/AppData/app_providers.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_meta_data.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:math' as dM;
import 'Data/AppData/app_preferences.dart';
import 'Data/DataSource/Resources/imports.dart';
import 'Presentation/Widgets/Onboarding/splash_screen.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("_messaging onBackgroundMessage: ${message.notification!.title!} ${message.notification!.body!}");
  final id = dM.Random().nextInt(20000);
  // var data = await e.notification!.body;
  print("Running Background notification $message");
  if (message.notification != null) {
    //  String? title= e.notification.title;
    // NotificationServices().showNotification(
    //     id,
    //     message.notification!.title.toString(),
    //     message.notification!.body.toString(),
    //     payload: message.notification!.title);
  }

  return;
}

class DownloadCallBack {
  static void downloadCallBackTest(id, status, progress) {
    if (kDebugMode) {
      print(id);
    }
    if (kDebugMode) {
      print(status);
    }
    if (kDebugMode) {
      print(progress);
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  await Firebase.initializeApp();

  await NotificationServices().initNotification();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();
  await ScreenUtil.ensureScreenSize();

  await FlutterDownloader.initialize();
  await FlutterDownloader.registerCallback(
      DownloadCallBack.downloadCallBackTest);

  runApp(MultiBlocProvider(
      providers: appProviders,
      child: MyApp(
        message: message,
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.message});

  final RemoteMessage? message;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    init(widget.message);
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'BuySellBiz',
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    surfaceTintColor: AppColors.whiteColor,
                    backgroundColor: AppColors.whiteColor),
                bottomAppBarTheme: const BottomAppBarTheme(
                    surfaceTintColor: Colors.transparent),
                primaryColor: AppColors.primaryColor,
                scaffoldBackgroundColor: AppColors.whiteColor,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.shifting)),
            home: SplashScreen(message: widget.message),
            // home: const SignUpScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }

  init(RemoteMessage? message) {
    NotificationMetaData().messagingInitiation();
  }
}
