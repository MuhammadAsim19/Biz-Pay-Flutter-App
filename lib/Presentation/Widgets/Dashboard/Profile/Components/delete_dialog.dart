import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/DeleteAccount/delete_account_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 255.sp,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget(
            url: Assets.publishIconSuccess,
            width: 90.w,
            height: 86.h,
          ),
          10.y,
          AppText("Account deleted",
              style: Styles.circularStdMedium(context,
                  fontSize: 18, color: AppColors.primaryColor)),
          10.y,
          AppText(
            "You’ve successfully deleted your account\n  and will no longer be able to recover it.",
            style: Styles.circularStdRegular(context),
            maxLine: 2,
          )
        ],
      ),
    );
  }
}

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
            Assets.delete,
            width: 70.w,
            height: 76.h,
            color: Colors.red,
          ),
          10.y,
          AppText(AppStrings.deleteAccount,
              style: Styles.circularStdRegular(context,
                  fontSize: 22.sp, color: AppColors.primaryColor)),
          Padding(
            padding: EdgeInsets.all(3.sp),
            child: AppText(AppStrings.areYouSureToDelete,
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
                  context.read<DeleteAccountCubit>().deleteAccount();
                  // SharedPrefs.clearUserData();
                  // Navigate.toReplaceAll(context, const LoginOnboard());
                },
                text: AppStrings.deleteAccount,
                textSize: 14.sp,
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
