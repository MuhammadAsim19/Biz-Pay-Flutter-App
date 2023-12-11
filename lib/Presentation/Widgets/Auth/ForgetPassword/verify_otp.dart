import 'dart:async';

import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Auth/forget_email.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Components/pin_code.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Components/show_timer_seconds.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_email_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_otp_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/set_password.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtp extends StatefulWidget {
  VerifyOtp({super.key, this.userID, this.email});

  String? userID;
  String? email;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Timer? timer1;

  int? time1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.sp, horizontal: 24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.y,
              const BackArrowWidget(),
              20.y,
              AppText(AppStrings.verifyEmail,
                  style: Styles.circularStdBold(context,
                      fontSize: 20.sp, fontWeight: FontWeight.w500)),
              5.y,
              AppText(
                'A 4 digit code sent to ${widget.email} enter code to continue',
                style: Styles.circularStdRegular(context,
                    fontSize: 14.sp, color: AppColors.greyTextColor),
                maxLine: 3,
              ),
              const Spacer(),
              PinCodeExample(
                controller: otpController,
                formKey: formKey,
              ),
              6.y,
              time1 == null
                  ? ShowTimerText(
                      onComplate: (time, timer) {
                        timer1 = timer;
                        time1 = time;
                        setState(() {});
                      },
                    )
                  : Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          time1 = null;
                          context.read<VerifyEmailCubit>().verifyEmail(
                              email: widget.email!, loading: false);
                          setState(() {});
                        },
                        child: AppText(
                          AppStrings.resendOtp,
                          style: Styles.circularStdRegular(context,
                              fontSize: 16.sp, color: AppColors.primaryColor),
                          maxLine: 2,
                        ),
                      ),
                    ),
              const Spacer(),
              BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
                listener: (context, state) {
                  if (state is VerifyOtpLoading) {
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is VerifyOtpError) {
                    Navigator.of(context).pop(true);
                    WidgetFunctions.instance.snackBar(context,
                        text: state.error, bgColor: AppColors.primaryColor);
                  }
                  if (state is VerifyOtpLoaded) {
                    Navigate.toReplace(
                        context,
                        SetPassword(
                          resetToken: state.otpToken,
                        ));
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (time1 == null) {
                          otpController.clear();
                          context.read<VerifyOtpCubit>().verify(
                              otpController.text.trim(), widget.userID!,
                              loading: false);
                        } else {
                          WidgetFunctions.instance.snackBar(context,
                              bgColor: AppColors.primaryColor,
                              text: 'Resend Otp');
                        }
                      }
                    },
                    text: 'Submit',
                    borderRadius: 25.sp,
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
