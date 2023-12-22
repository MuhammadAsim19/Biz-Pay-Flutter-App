import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Data/DataSource/Resources/validator.dart';
import 'package:buysellbiz/Presentation/Common/ContextWidgets/common_diaolg_widget.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/ChangePassword/change_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatelessWidget {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  ChangePassword({super.key});

  final _formKey = GlobalKey<FormState>();

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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(AppStrings.oldPassword,
                        style: Styles.circularStdBold(context,
                            color: AppColors.blackColor, fontSize: 16.sp)),
                    CustomTextFieldWithOnTap(
                        validateText: 'Old Password Required',
                        suffixIcon: SvgPicture.asset(Assets.hide),
                        borderRadius: 40.r,
                        isState: true,
                        prefixIcon: SvgPicture.asset(Assets.lock),
                        controller: oldPassword,
                        hintText: 'Old Password',
                        textInputType: TextInputType.name),
                    20.y,
                    AppText(AppStrings.newPassword,
                        style: Styles.circularStdBold(context,
                            color: AppColors.blackColor, fontSize: 16.sp)),
                    CustomTextFieldWithOnTap(
                        validator: Validate.password,
                        isState: true,
                        suffixIcon: SvgPicture.asset(Assets.hide),
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.lock),
                        controller: newPassword,
                        hintText: 'New Password',
                        textInputType: TextInputType.name),
                    CustomTextFieldWithOnTap(
                        validator: Validate.password,
                        isState: true,
                        suffixIcon: SvgPicture.asset(Assets.hide),
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.lock),
                        controller: confirmPassword,
                        hintText: 'Confirm Password',
                        textInputType: TextInputType.emailAddress),
                  ],
                ),
              ),
              120.y,
              BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordLoading) {
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is ChangePasswordLoaded) {
                    Navigator.pop(context);
                    CustomDialog.successDialog(context,
                        title: 'Password Changed',
                        message: 'password change success ful');
                  }
                  if (state is ChangePasswordError) {
                    Navigator.pop(context);
                    WidgetFunctions.instance.showErrorSnackBar(
                        context: context, error: state.error);
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return CustomButton(
                    gapWidth: 7.w,
                    imageHeight: 20.h,
                    imageWidth: 20.w,
                    leadingSvgIcon: true,
                    width: 320.w,
                    borderRadius: 40.r,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (confirmPassword.text == newPassword.text) {
                          var data = {
                            "oldPassword": oldPassword.text.trim(),
                            "newPassword": newPassword.text.trim(),
                          };
                          context
                              .read<ChangePasswordCubit>()
                              .changePassword(data);
                        } else {
                          WidgetFunctions.instance.showErrorSnackBar(
                              context: context,
                              error: 'Check Confirm Password');
                        }
                      }
                    },
                    text: AppStrings.update,
                    bgColor: AppColors.primaryColor,
                    textFontWeight: FontWeight.w700,
                    textSize: 16.sp,
                    textColor: AppColors.whiteColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
