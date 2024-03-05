import 'dart:io';

import 'package:buysellbiz/Application/Services/Connectivity/connectivity_service.dart';
import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/AppData/app_initializer.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_meta_data.dart';
import 'package:buysellbiz/Data/Services/firebase_services.dart';
import 'package:buysellbiz/Presentation/Common/no_internet_connection.dart';
import 'package:buysellbiz/Presentation/Widgets/Onboarding/onboarding.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.message});

  final RemoteMessage? message;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String? token;

  checkToken() async {
    token = SharedPrefs.getUserToken();

    print(token);
  }

  connection() async {
    AppConnectivity.connectionChanged(
      onConnected: () {
        // Navigator.of(context).pop();
      },
      onDisconnected: () {
        if (mounted) {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) {
              return const NoInternetConnection();
            },
          ));
        }
        // Navigate.to(context, const NoInternetConnection());
      },
    );
  }

  @override
  void initState() {
    // init(context);
    super.initState();
    checkToken();
    if (Platform.isIOS) {
    } else {
      connection();
    }
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInExpo);
    _controller.forward();

    // Navigate to another screen after the splash animation finishes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to another screen (e.g., HomeScreen)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => token != null
                  ? BottomNavigationScreen(
                      message: widget.message,
                    )
                  : BottomNavigationScreen(
                      message: widget.message,
                    )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            height: 1.sh,
            width: 1.sw,
            child: Center(child: SvgPicture.asset(Assets.logo))),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
