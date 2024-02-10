import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Components/notification_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/read_notification_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    this.data,
  });

  final NotificationModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: data!.isRead == true
              ? AppColors.whiteColor
              : AppColors.dottedGreyColor,
          border: Border.all(color: AppColors.borderColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedImage(
              radius: 25.sp,
              isCircle: true,
              height: 50.h,
              width: 50.w,
              url: "${ApiConstant.baseurl}/${data?.icon!}"),
          15.x,
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(data?.type ?? "",
                        style: Styles.circularStdRegular(context,
                            color: data!.isRead == true
                                ? AppColors.blackColor
                                : AppColors.greyLightColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400)),
                    const Spacer(),
                    AppText(data!.createdAt!.timeAgo(numericDates: false),
                        style: Styles.circularStdRegular(
                          context,
                          color: data!.isRead == true
                              ? AppColors.greyTextColor
                              : AppColors.greyLightColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                5.y,
                AppText(data?.message ?? "",
                    maxLine: 1,
                    style: Styles.circularStdRegular(
                      context,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: data!.isRead == true
                          ? AppColors.greyTextColor
                          : AppColors.greyLightColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
