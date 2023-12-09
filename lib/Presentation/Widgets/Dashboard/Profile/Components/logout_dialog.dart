import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/login.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/login_onboard.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.roundBluetick,
            width: 80.w,
            height: 86.h,
          ),
          AppText(AppStrings.logout,
              style: Styles.circularStdRegular(context,
                  fontSize: 24.sp, color: AppColors.primaryColor)),
          Padding(
            padding: EdgeInsets.all(3.sp),
            child: AppText(AppStrings.areYousure,
                maxLine: 2,
                style: Styles.circularStdRegular(context,
                    fontSize: 16.sp, color: AppColors.greyMedium)),
          ),
          12.y,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              30.x,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                child: AppText(AppStrings.cancel,
                    style: Styles.circularStdRegular(context,
                        fontSize: 16.sp, color: AppColors.greyMedium)),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  Navigate.toReplaceAll(context, const LoginOnboard());
                },
                text: AppStrings.logout,
                height: 45.h,
                width: 125.w,
              ),
              30.x,
            ],
          ),
          10.y,
        ],
      ),
    );
  }
}
