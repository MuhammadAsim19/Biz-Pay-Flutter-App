import 'Data/DataSource/Resources/imports.dart';
import 'Presentation/Widgets/Onboarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
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
            theme: ThemeData(primaryColor: AppColors.primaryColor),
            home: const SplashScreen(),
            // home: const SignUpScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
