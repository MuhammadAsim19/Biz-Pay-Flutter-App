import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/verify_email.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/sign_up.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.sp, horizontal: 24.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.y,
                const BackArrowWidget(),
                20.y,
                AppText(AppStrings.logintoApp,
                    style: Styles.circularStdBold(context,
                        fontSize: 20.sp, fontWeight: FontWeight.w500)),
                5.y,
                AppText(
                  AppStrings.welcome2,
                  style: Styles.circularStdRegular(context,
                      fontSize: 14.sp, color: AppColors.greyTextColor),
                  maxLine: 2,
                ),
                20.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    prefixIcon: SvgPicture.asset('assets/images/email.svg'),
                    controller: email,
                    hintText: AppStrings.email,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                25.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    prefixIcon: SvgPicture.asset('assets/images/lock.svg'),
                    suffixIcon: SvgPicture.asset('assets/images/hide_pass.svg'),
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    controller: password,
                    hintText: AppStrings.password,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                10.y,
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigate.to(context, VerifyEmail());
                    },
                    child: AppText(
                      AppStrings.forgetPassword,
                      style: Styles.circularStdRegular(context,
                          fontSize: 14.sp,
                          color: AppColors.greyTextColor,
                          fontWeight: FontWeight.w400),
                      maxLine: 2,
                    ),
                  ),
                ),
                50.y,
                CustomButton(
                  onTap: () {},
                  text: 'Login',
                  borderRadius: 25.sp,
                ),
                160.y,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppText(AppStrings.noHaveAccount,
                      style: Styles.circularStdBold(context,
                          color: AppColors.greyColor)),
                  5.x,
                  InkWell(
                    onTap: () {
                      Navigate.to(context, SignUpScreen());
                    },
                    child: AppText(AppStrings.register,
                        style: Styles.circularStdBold(context,
                            color: AppColors.blackColor)),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
