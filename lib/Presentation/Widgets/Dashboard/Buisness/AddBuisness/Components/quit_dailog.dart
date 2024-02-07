import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  const ConfirmDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.blueCheck,
            width: 70.w,
            height: 76.h,
          ),
          10.y,
          AppText(AppStrings.confirmation,
              style: Styles.circularStdRegular(context,
                  fontSize: 22.sp, color: AppColors.primaryColor)),
          Padding(
            padding: EdgeInsets.all(3.sp),
            child: AppText(AppStrings.areYouSureToCancelBusiness,
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
                        fontSize: 14.sp, color: AppColors.greyMedium)),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                text: "Yes Sure",
                textSize: 14.sp,
                height: 45.h,
                width: 105.w,
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
