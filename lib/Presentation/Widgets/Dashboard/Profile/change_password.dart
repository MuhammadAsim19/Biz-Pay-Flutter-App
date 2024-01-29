import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/ContextWidgets/common_diaolg_widget.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
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
          child: Form(
            key: _formKey,
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
                        controller: oldPassword,
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
                        controller: newPassword,
                        hintText: 'New Password',
                        textInputType: TextInputType.name),
                    CustomTextFieldWithOnTap(
                        isState: true,
                        suffixIcon: SvgPicture.asset(Assets.hide),
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.lock),
                        controller: confirmPassword,
                        hintText: 'Confirm Password',
                        textInputType: TextInputType.emailAddress),
                  ],
                ),
                120.y,
                BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                  listener: (context, state) {
                    if (state is ChangePasswordLoading) {
                      LoadingDialog.showLoadingDialog(context);
                    }
                    if (state is ChangePasswordLoaded) {
                      Navigator.pop(context);
                      CustomDialog.dialog(
                          context,
                          const CommonDialog(
                            titleText: 'Password change successfully',
                            descriptionText:
                                'You’ve successfully change your password!',
                          ),
                          barrierDismissible: true);
                    }
                    if (state is ChangePasswordError) {
                      WidgetFunctions.instance
                          .snackBar(context, text: state.error);
                      Navigator.pop(context);
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
                        var data = {
                          "oldPassword": oldPassword.text.trim(),
                          "newPassword": newPassword.text.trim()
                        };
                        if (_formKey.currentState!.validate()) {
                          if (newPassword.text.trim() ==
                              confirmPassword.text.trim()) {
                            context
                                .read<ChangePasswordCubit>()
                                .changePassword(data);
                            _clear();
                          } else {
                            WidgetFunctions.instance.snackBar(context,
                                text: 'Password Not Matched');
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
      ),
    );
  }

  _clear() {
    newPassword.clear();
    confirmPassword.clear();
    oldPassword.clear();
  }
}
