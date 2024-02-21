import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/validator.dart';
import 'package:buysellbiz/Data/Services/firebase_services.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_date_picker.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/verify_otp.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/login.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Controllers/agree_to_privacy.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Controllers/sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Components/country_picker.dart';
import 'Components/terms_condition_row.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final email = TextEditingController();

  final password = TextEditingController();

  final firstName = TextEditingController();

  final lastName = TextEditingController();

  final phone = TextEditingController();

  final calender = TextEditingController();

  String countryCode = '+1';

  bool checked = false;

  bool onTapField = false;

  final formKey = GlobalKey<FormState>();

  String? fcmToken;

  getToken() async {
    fcmToken = await FirebaseServices.getFcm();
  }

  @override
  void initState() {
    AgreeToPrivacyAndTerms.agree.value = false;

    getToken();
    // TODO: implement initState
    super.initState();
  }

  void _signUp() {
    print(phone.text);

    if (formKey.currentState!.validate()) {
      if (AgreeToPrivacyAndTerms.agree.value) {
        var body = {
          "firstName": firstName.text.trim(),
          "lastName": lastName.text.trim(),
          "email": email.text.trim(),
          "phone": phone.text.isEmpty ? "" : "$countryCode${phone.text.trim()}",
          "password": password.text.trim(),
          "dob": calender.text.isEmpty ? "" : calender.text.trim(),
          "fcm_token": fcmToken,
        };

        context.read<SignUpCubit>().createUser(body: body);
      } else {
        WidgetFunctions.instance
            .snackBar(context, text: 'Check Terms and condition');
      }
    }
  }

  // final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.y,
                const BackArrowWidget(),
                20.y,
                AppText(AppStrings.welcome,
                    style: Styles.circularStdBold(context,
                        fontSize: 20.sp, fontWeight: FontWeight.w500)),
                5.y,
                AppText(
                  AppStrings.signUpDesc,
                  style: Styles.circularStdRegular(context,
                      fontSize: 14.sp, color: AppColors.greyTextColor),
                  maxLine: 2,
                ),
                30.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.sp, horizontal: 12),
                    prefixIcon: SvgPicture.asset(Assets.person),
                    controller: firstName,
                    hintText: AppStrings.firstname,
                    textInputType: TextInputType.text,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Add First Name';
                      }
                      if (val.length < 2) {
                        return 'First Name should be greater than 2';
                      }
                      return null;
                    },
                    borderRadius: 25.sp),
                20.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.sp, horizontal: 12),
                    prefixIcon: SvgPicture.asset(Assets.person),
                    controller: lastName,
                    hintText: AppStrings.lastName,
                    textInputType: TextInputType.text,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Add Last Name';
                      }
                      if (val.length < 2) {
                        return 'Last Name should be greater than 2';
                      }
                      return null;
                    },
                    borderRadius: 25.sp),
                20.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.sp, horizontal: 12),
                    prefixIcon: SvgPicture.asset(Assets.email),
                    validator: Validate.email,
                    controller: email,
                    hintText: AppStrings.email,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                25.y,
                CountryPicker(
                  countrySelect: (value) {
                    countryCode = value!;
                    print(value);
                    setState(() {});
                  },
                  controller: phone,
                  validator: Validate.phone,
                  onTapField: onTapField,
                ),
                25.y,
                CustomDatePickerValidateWidget(
                  controller: calender,
                  validator: Validate.dob,
                  isBorderRequired: true,
                  hintText: AppStrings.dob,
                  prefixIcon: SvgPicture.asset(Assets.calender),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13.sp, horizontal: 12),

                  // prefixIcon: ,
                ),
                // CustomTextFieldWithOnTap(
                //     isBorderRequired: true,
                //     contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                //     prefixIcon: SvgPicture.asset('assets/images/calendar.svg'),
                //     controller: calender,
                //     hintText: AppStrings.dob,
                //     textInputType: TextInputType.text,
                //     borderRadius: 25.sp),
                20.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    prefixIcon: SvgPicture.asset(Assets.lock),
                    isState: true,
                    // suffixIcon: InkWell(
                    //     onTap: () {
                    //       SignUpControllers.passwordShowHide.value = !value;
                    //     },
                    //     child: SvgPicture.asset(value == false
                    //         ? Assets.hidePassword
                    //         : Assets.showPass)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.sp, horizontal: 12),
                    controller: password,
                    validator: Validate.password,
                    hintText: AppStrings.password,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                10.y,
                const TermsAndConditionTextRow(),
                53.y,
                BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpLoading) {
                      LoadingDialog.showLoadingDialog(context);
                    }
                    if (state is SignUpError) {
                      Navigator.of(context).pop(true);
                      WidgetFunctions.instance.snackBar(context,
                          text: state.error,
                          bgColor: AppColors.primaryColor,
                          textStyle: Styles.circularStdRegular(context,
                              color: AppColors.whiteColor));
                    }
                    if (state is SignUpLoaded) {
                      Navigator.pop(context);
                      Navigate.toReplace(
                          context,
                          VerifyOtpScreen(
                            userID: state.userModel?.user?.id,
                            email: state.userModel?.user?.email,
                            isFromSignUp: true,
                          ));
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () => _signUp(),
                      text: state is SignUpLoading
                          ? "Loading..."
                          : AppStrings.register,
                      borderRadius: 25.sp,
                    );
                  },
                ),
                20.y,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppText(AppStrings.haveAccount,
                      style: Styles.circularStdBold(context,
                          color: AppColors.greyColor)),
                  5.x,
                  InkWell(
                    onTap: () {
                      Navigate.to(context, const LoginScreen());
                    },
                    child: AppText(AppStrings.login,
                        style: Styles.circularStdBold(context,
                            color: AppColors.blackColor)),
                  )
                ]),
                20.y,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
