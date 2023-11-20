import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/verify_email.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/sign_up.dart';

import '../../../Common/dialog.dart';

class SetPassword extends StatelessWidget {
  SetPassword({super.key});

  final password = TextEditingController();
  final confirmPassword = TextEditingController();

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
                AppText(AppStrings.resetPassword,
                    style: Styles.circularStdBold(context,
                        fontSize: 20.sp, fontWeight: FontWeight.w500)),
                5.y,
                AppText(
                  AppStrings.confirmToReset,
                  style: Styles.circularStdRegular(context,
                      fontSize: 14.sp, color: AppColors.greyTextColor),
                  maxLine: 2,
                ),
                20.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    prefixIcon: SvgPicture.asset('assets/images/lock.svg'),
                    suffixIcon: SvgPicture.asset('assets/images/hide_pass.svg'),
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    controller: password,
                    hintText: AppStrings.password,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                25.y,
                CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                    prefixIcon: SvgPicture.asset('assets/images/lock.svg'),
                    suffixIcon: SvgPicture.asset('assets/images/hide_pass.svg'),
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    controller: confirmPassword,
                    hintText: AppStrings.password,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                250.y,
                CustomButton(
                  onTap: () {
                    CustomDialog.successDialog(context,
                        title: AppStrings.passwordChanged,
                        message: AppStrings.passwordChangedSuccess);
                  },
                  text: 'Update',
                  borderRadius: 25.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}