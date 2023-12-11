import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/validator.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/set_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Common/dialog.dart';

class SetPassword extends StatelessWidget {
  SetPassword({super.key, this.resetToken});

  final String? resetToken;

  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.sp, horizontal: 24.sp),
            child: Form(
              key: formKey,
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
                  110.y,
                  CustomTextFieldWithOnTap(
                      isBorderRequired: true,
                      prefixIcon: SvgPicture.asset('assets/images/lock.svg'),
                      isState: true,
                      validator: Validate.password,
                      // suffixIcon: InkWell(
                      //     onTap: () {
                      //       ForgetControllers.passwordShowHide.value = !value;
                      //     },
                      //     child: SvgPicture.asset(value == false
                      //         ? Assets.hidePassword
                      //         : Assets.showPass)),
                      contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                      controller: password,
                      hintText: AppStrings.password,
                      textInputType: TextInputType.text,
                      borderRadius: 25.sp),
                  10.y,
                  CustomTextFieldWithOnTap(
                      isBorderRequired: true,
                      prefixIcon: SvgPicture.asset('assets/images/lock.svg'),
                      isState: true,
                      validator: (val) {
                        if (val!.trim().isEmpty) {
                          return "Please provide Password";
                        }
                        // } else if (val.toString().length != password.text.length) {
                        //   return 'Password length does not match';
                        // }
                        else if (val.toString() != password.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                      contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                      controller: confirmPassword,
                      hintText: AppStrings.confirmPassword,
                      textInputType: TextInputType.text,
                      borderRadius: 25.sp),
                  200.y,
                  BlocConsumer<SetPasswordCubit, SetPasswordState>(
                    listener: (context, state) {
                      if (state is SetPasswordLoading) {
                        LoadingDialog.showLoadingDialog(context);
                      }
                      if (state is SetPasswordError) {
                        Navigator.of(context).pop(true);
                        WidgetFunctions.instance.snackBar(context,
                            bgColor: AppColors.primaryColor, text: state.error);
                      }
                      if (state is SetPasswordLoaded) {
                        Navigator.of(context).pop(true);
                        CustomDialog.successDialog(context,
                            title: AppStrings.passwordChanged,
                            message: AppStrings.passwordChangedSuccess);
                      }
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (password.text.trim() ==
                                confirmPassword.text.trim()) {
                              context.read<SetPasswordCubit>().setPassword(
                                  resetToken!, password.text.trim());
                            } else {
                              WidgetFunctions.instance.snackBar(context,
                                  bgColor: AppColors.primaryColor,
                                  text: 'Check Confirm Password');
                            }
                          }
                        },
                        text: 'Update',
                        borderRadius: 25.sp,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
