import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 48.h,
                width: 50.w,
                child: SvgPicture.asset('assets/images/no_internet.svg')),
            15.y,
            AppText(AppStrings.ooops,
                style: Styles.circularStdBold(context,
                    fontSize: 18.sp, fontWeight: FontWeight.w500)),
            7.y,
            AppText(AppStrings.noInternetConnection,
                maxLine: 2,
                textAlign: TextAlign.center,
                style: Styles.circularStdRegular(context,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyTextColor)),
            52.y,
            CustomButton(
              height: 46.h,
              horizontalMargin: 40.sp,
              onTap: () {
                Navigator.of(context).pop(true);
              },
              text: 'Try Again',
              borderRadius: 40.sp,
            )
          ],
        ),
      ),
    );
  }
}
