import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Components/pin_code.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/set_password.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/sign_up.dart';

class VerifyOtp extends StatelessWidget {
  VerifyOtp({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

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
                AppStrings.codeSendToMail,
                style: Styles.circularStdRegular(context,
                    fontSize: 14.sp, color: AppColors.greyTextColor),
                maxLine: 2,
              ),
              const Spacer(),
              const PinCodeExample(),
              const Spacer(),
              CustomButton(
                onTap: () {
                  Navigate.to(context, SetPassword());
                },
                text: 'Verify',
                borderRadius: 25.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
