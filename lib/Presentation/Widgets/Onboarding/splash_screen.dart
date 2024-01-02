import 'package:buysellbiz/Data/AppData/app_initializer.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_meta_data.dart';
import 'package:buysellbiz/Data/Services/firebase_services.dart';
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

  @override
  void initState() {
    // init(context);
    super.initState();
    checkToken();

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
                : const OnboardingScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child:
                AssetImageWidget(url: Assets.logo, height: 100.h, width: 300.w),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
