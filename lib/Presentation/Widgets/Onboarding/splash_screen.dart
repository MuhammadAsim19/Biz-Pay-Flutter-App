import 'package:buysellbiz/Data/AppData/app_initializer.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

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
            builder: (context) => const OnboardingScreen(),
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
