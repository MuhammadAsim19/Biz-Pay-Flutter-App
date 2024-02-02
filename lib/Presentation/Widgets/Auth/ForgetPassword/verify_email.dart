import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/validator.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_email_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/verify_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
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
                AppText(AppStrings.forgetPasswordSc1,
                    style: Styles.circularStdBold(context,
                        fontSize: 20.sp, fontWeight: FontWeight.w500)),
                5.y,
                AppText(
                  AppStrings.forgetPasswordSc2,
                  style: Styles.circularStdRegular(context,
                      fontSize: 14.sp, color: AppColors.greyTextColor),
                  maxLine: 2,
                ),
                const Spacer(),
                CustomTextFieldWithOnTap(
                    validator: Validate.email,
                    isBorderRequired: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                    prefixIcon: SvgPicture.asset('assets/images/email.svg'),
                    controller: email,
                    hintText: AppStrings.email,
                    textInputType: TextInputType.text,
                    borderRadius: 25.sp),
                const Spacer(),
                BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
                  listener: (context, state) {
                    if (state is VerifyEmailLoading) {
                      LoadingDialog.showLoadingDialog(context);
                    }
                    if (state is VerifyEmailLoaded) {
                      Navigator.of(context).pop(true);
                      if (state.loading == null) {
                        email.clear();
                        Navigate.to(
                            context,
                            VerifyOtpScreen(
                              isFromSignUp: false,
                              userID: state.userId,
                              email: email.text.trim(),
                            ));
                      }
                    }
                    if (state is VerifyEmailError) {
                      Navigator.of(context).pop(true);
                      WidgetFunctions.instance.snackBar(context,
                          bgColor: AppColors.primaryColor, text: state.error);
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<VerifyEmailCubit>()
                              .verifyEmail(email: email.text.trim());
                        }
                      },
                      text: 'Send',
                      borderRadius: 25.sp,
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
}
