import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/ContextWidgets/common_diaolg_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.changePassword,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              40.y,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(AppStrings.oldPassword,
                      style: Styles.circularStdBold(context,
                          color: AppColors.blackColor, fontSize: 16.sp)),
                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.hide),
                      borderRadius: 40.r,
                      isState: true,
                      prefixIcon: SvgPicture.asset(Assets.lock),
                      controller: oldpassword,
                      hintText: 'Old Password',
                      textInputType: TextInputType.name),
                  20.y,
                  AppText(AppStrings.newPassword,
                      style: Styles.circularStdBold(context,
                          color: AppColors.blackColor, fontSize: 16.sp)),
                  CustomTextFieldWithOnTap(
                      isState: true,
                      suffixIcon: SvgPicture.asset(Assets.hide),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.lock),
                      controller: newpassword,
                      hintText: 'New Password',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      isState: true,
                      suffixIcon: SvgPicture.asset(Assets.hide),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.lock),
                      controller: confirmpassword,
                      hintText: 'Confirm Password',
                      textInputType: TextInputType.emailAddress),
                ],
              ),
              120.y,
              CustomButton(
                gapWidth: 7.w,
                imageHeight: 20.h,
                imageWidth: 20.w,
                leadingSvgIcon: true,
                width: 320.w,
                borderRadius: 40.r,
                onTap: () {
                  CustomDialog.dialog(
                      context,
                      const CommonDialog(
                        titleText: 'Password change successfully',
                        descriptionText:
                            'You’ve successfully change your password!',
                      ),
                      barrierDismissible: true);
                },
                text: AppStrings.update,
                bgColor: AppColors.primaryColor,
                textFontWeight: FontWeight.w700,
                textSize: 16.sp,
                textColor: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
