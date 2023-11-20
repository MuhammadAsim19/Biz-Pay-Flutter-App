import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/login_onboard.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.splashImage), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              bottom: 0.sp,
              child: AssetImageWidget(
                url: Assets.background,
                height: 440.h,
                width: 1.sw,
              ),
            ),
            Positioned(
                bottom: 120.sp,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText('#1 Marketplace to buy \n& sell businesses',
                          style: Styles.circularStdBold(
                            context,
                            color: AppColors.whiteColor,
                            fontSize: 28.sp,
                          ),
                          maxLine: 2),
                      10.y,
                      AppText(
                          'Find the perfect business, franchise to buy or \nsell your business.',
                          style: Styles.circularStdMedium(
                            context,
                            color: AppColors.whiteColor,
                            fontSize: 12.sp,
                          ),
                          maxLine: 2),
                      20.y,
                    ],
                  ),
                )),
            Positioned(
              bottom: 30.sp,
              left: 25.sp,
              child: CustomButton(
                  text: 'Get Started',
                  onTap: () {
                    Navigate.toReplaceAll(context, const LoginOnboard());
                  },
                  height: 46.h,
                  width: 300.w,
                  borderRadius: 25.r),
            ),
          ],
        ),
      ),
    );
  }
}
