import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Repository/AppleRepo/apple_repo.dart';
import 'package:buysellbiz/Data/DataSource/Repository/GoogleRepo/google_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/auth_buttons.dart';
import 'package:buysellbiz/Presentation/Common/widget_functions.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginOnboard extends StatefulWidget {
  const LoginOnboard({super.key});

  @override
  State<LoginOnboard> createState() => _LoginOnboardState();
}

class _LoginOnboardState extends State<LoginOnboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.y,
                AppText(AppStrings.welcome,
                    style: Styles.circularStdBold(context,
                        fontSize: 20.sp, fontWeight: FontWeight.w500)),
                5.y,
                AppText(
                  AppStrings.welcome2,
                  style: Styles.circularStdRegular(context,
                      fontSize: 14.sp, color: AppColors.greyTextColor),
                  maxLine: 2,
                ),
                60.y,
                AuthButtons(
                  color: AppColors.whiteColor,
                  height: 45.h,
                  width: 330.w,
                  text: AppStrings.loginWithEmail,
                  isBorderRequired: true,
                  image: 'assets/images/email.svg',
                  onTap: () {
                    Navigate.to(context, LoginScreen());
                  },
                ),
                30.y,
                SizedBox(
                  width: 1.sw,
                  height: 30.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.borderColor,
                          height: 10.h,
                        ),
                      ),
                      10.x,
                      AppText('or', style: Styles.circularStdMedium(context)),
                      10.x,
                      Expanded(
                        child: Divider(
                          color: AppColors.borderColor,
                          height: 10.h,
                        ),
                      ),
                    ],
                  ),
                ),
                30.y,
                AuthButtons(
                  color: AppColors.lightBlueColor,
                  onTap: ()
                  {
                    _onGoogle();
                  },
                  height: 45.h,
                  width: 330.w,
                  text: AppStrings.loginWithGoogle,
                  isBorderRequired: false,
                  image: 'assets/images/google.svg',
                ),
                30.y,
                AuthButtons(
                  color: AppColors.blackColor,
                  height: 45.h,
                  width: 330.w,
                  onTap: ()
                  async {
                    var userData= await  AppleRepo.getAppleLoginData(context);
                    if(userData!=null)
                    {
                      var email=userData!.user?.email;
                      var name =userData!.user?.displayName;
                      var photoUrl=userData!.user?.photoURL;
                      print("${"email"+email.toString()+"name"+name}photo url:"+photoUrl);
                     // sendToSocial(email,name,photoUrl,"apple");

                    }

                  },
                  text: AppStrings.continueWithApple,
                  isBorderRequired: false,
                  image: 'assets/images/apple.svg',
                  textColor: AppColors.whiteColor,
                ),
                100.y,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(AppStrings.registerUS,
                        style: Styles.circularStdBold(context,
                            color: AppColors.greyColor)),
                    5.x,
                    AppText(AppStrings.appName,
                        style: Styles.circularStdBold(context,
                            color: AppColors.blackColor))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onGoogle() async {
    //FirebaseAuth auth = FirebaseAuth.instance;

    User? user = await GoogleRepo.signInWithGoogle(context: context);
    if (mounted) {
      if (user?.email != null) {
        print(user?.email.toString());
        print(user?.displayName.toString());
        print(user?.uid.toString());
      } else {
        WidgetFunctions.instance
            .snackBar(context, text: 'Login Cancelled', bgColor: Colors.orange);
      }
    }
  }
}
