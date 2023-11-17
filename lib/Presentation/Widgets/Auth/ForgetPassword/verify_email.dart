import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/sign_up.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});

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
              Spacer(),
              CustomTextFieldWithOnTap(
                  isBorderRequired: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 13.sp),
                  prefixIcon: SvgPicture.asset('assets/images/email.svg'),
                  controller: email,
                  hintText: AppStrings.email,
                  textInputType: TextInputType.text,
                  borderRadius: 25.sp),
              Spacer(),
              CustomButton(
                onTap: () {},
                text: 'Send',
                borderRadius: 25.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
