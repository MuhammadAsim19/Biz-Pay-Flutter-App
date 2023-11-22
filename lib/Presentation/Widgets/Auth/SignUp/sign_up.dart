import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_date_picker.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/login.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Controllers/hide_show_password.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BottomNavigation/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';

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

  bool checked = false;

  bool onTapField = false;

  // final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.y,
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
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    prefixIcon: SvgPicture.asset(Assets.person),
                    controller: firstName,
                    hintText: AppStrings.firstname,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                15.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    prefixIcon: SvgPicture.asset(Assets.person),
                    controller: lastName,
                    hintText: AppStrings.lastName,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                15.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    prefixIcon: SvgPicture.asset(Assets.email),
                    controller: email,
                    hintText: AppStrings.email,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                20.y,
                CountryPicker(
                  controller: phone,
                  onTapField: onTapField,
                ),
                20.y,
                CustomDatePickerValidateWidget(
                  controller: calender,
                  validator: (p0) {},
                  isBorderRequired: true,
                  hintText: AppStrings.dob,
                  prefixIcon: SvgPicture.asset(Assets.calender),
                  contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
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
                15.y,
                ValueListenableBuilder(
                  valueListenable: SignUpControllers.passwordShowHide,
                  builder: (context, value, child) {
                    return CustomTextFieldWithOnTap(
                        isBorderRequired: true,
                        prefixIcon: SvgPicture.asset(Assets.lock),
                        obscureText: value,
                        suffixIcon: InkWell(
                            onTap: () {
                              SignUpControllers.passwordShowHide.value = !value;
                            },
                            child: SvgPicture.asset(value == false
                                ? Assets.hidePassword
                                : Assets.showPass)),
                        contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                        controller: password,
                        hintText: AppStrings.password,
                        textInputType: TextInputType.text,
                        borderRadius: 25.sp);
                  },
                ),
                10.y,
                const TermsAndConditionTextRow(),
                53.y,
                CustomButton(
                  onTap: () {
                    BottomNotifier.bottomNavigationNotifier.value=0;
                    Navigate.toReplace(context, const BottomNavigationScreen());

                  },
                  text: AppStrings.register,
                  borderRadius: 25.sp,
                ),
                20.y,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppText(AppStrings.haveAccount,
                      style: Styles.circularStdBold(context,
                          color: AppColors.greyColor)),
                  5.x,
                  InkWell(
                    onTap: () {
                      Navigate.to(context, LoginScreen());
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
