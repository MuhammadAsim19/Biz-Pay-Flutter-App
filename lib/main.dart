import 'dart:io';

import 'package:buysellbiz/Data/AppData/app_providers.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'Data/AppData/app_preferences.dart';
import 'Data/DataSource/Resources/imports.dart';
import 'Presentation/Widgets/Onboarding/splash_screen.dart';
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
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiBlocProvider(providers: appProviders, child: const MyApp()));
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized(); //Add this line

  if (Platform.isIOS) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp();
  }
  await ScreenUtil.ensureScreenSize();
  await SharedPrefs.init();
  await FlutterDownloader.initialize();
  await FlutterDownloader.registerCallback(
      DownloadCallBack.downloadCallBackTest);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                primaryColor: AppColors.primaryColor,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.shifting)),
            home: const SplashScreen(),
            // home: const SignUpScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
