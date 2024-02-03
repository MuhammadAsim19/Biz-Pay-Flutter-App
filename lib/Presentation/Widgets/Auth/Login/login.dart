import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Auth/verify_otp.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/validator.dart';
import 'package:buysellbiz/Data/Services/firebase_services.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/widget_functions.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/verify_email.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/verify_otp.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/Controllers/login_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/sign_up.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BottomNavigation/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.fcmToken});

  final String? fcmToken;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();

  final password = TextEditingController();

  ValueNotifier<bool> showHidePassword = ValueNotifier(false);

  final formKey = GlobalKey<FormState>();

  String? fcmToken;

  getToken() async {
    fcmToken = await FirebaseServices.getFcm();
  }

  void _login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      var body = {
        "email": email.text,
        "password": password.text,
        "fcm_token": fcmToken ?? "",
      };
      context.read<LoginCubit>().loginUser(body: body);
    }
  }

  @override
  void initState() {
    getToken();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.sp, horizontal: 24.sp),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.y,
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
                25.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    prefixIcon: SvgPicture.asset(Assets.email),
                    controller: email,
                    validator: Validate.email,
                    hintText: AppStrings.email,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                15.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    prefixIcon: SvgPicture.asset(Assets.lock),
                    isState: true,
                    // suffixIcon: InkWell(
                    //     onTap: () {
                    //       showHidePassword.value = !value;
                    //     },
                    //     child: SvgPicture.asset(value == false
                    //         ? Assets.hidePassword
                    //         : Assets.showPass)),
                    //obscureText: value,
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    controller: password,
                    validator: Validate.loginPassword,
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
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      LoadingDialog.showLoadingDialog(context);
                    }
                    if (state is LoginError) {
                      Navigator.pop(context);
                      WidgetFunctions.instance.snackBar(context,
                          bgColor: AppColors.primaryColor, text: state.error);
                    }
                    if (state is LoginLoaded) {
                      print(state.userData?.user?.toJson());

                      Navigator.pop(context);
                      // WidgetFunctions.instance.snackBar(context,
                      //     bgColor: AppColors.primaryColor,
                      //     text: "Login Successfully");

                      BottomNotifier.bottomNavigationNotifier.value = 0;
                      if (state.userData?.user?.otpModel?.isVerified == true) {
                        Navigate.toReplaceAll(
                            context, const BottomNavigationScreen());
                      } else {
                        print(state.userData?.user?.id);
                        Navigate.to(
                            context,
                            VerifyOtpScreen(
                              isFromSignUp: true,
                              userID: state.userData?.user?.id,
                              email: state.userData?.user?.email,
                            ));
                      }
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () => _login(context),
                      text: state is LoginLoading ? 'Loading....' : 'Login',
                      borderRadius: 25.sp,
                    );
                  },
                ),
                160.y,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppText(AppStrings.noHaveAccount,
                      style: Styles.circularStdBold(context,
                          color: AppColors.greyColor)),
                  5.x,
                  InkWell(
                    onTap: () {
                      Navigate.to(context, const SignUpScreen());
                    },
                    child: AppText(AppStrings.register,
                        style: Styles.circularStdBold(context,
                            color: AppColors.blackColor)),
                  )
                ]),

                // CustomButton(onTap: (){
                //   Navigate.to(context, ServiceScreen());
                // }, text: "test")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
