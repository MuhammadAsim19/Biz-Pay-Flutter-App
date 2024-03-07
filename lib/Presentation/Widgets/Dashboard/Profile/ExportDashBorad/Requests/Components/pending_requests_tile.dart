import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key, this.badges, this.isFromBusiness});

  final BadgesRequest? badges;
  final bool? isFromBusiness;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(badges?.businessReff?.name ?? "",
              style: Styles.circularStdMedium(context, fontSize: 16)),
          4.y,
          AppText(
              isFromBusiness != true
                  ? 'Customer Name : ${badges?.userReff?.fullName}'
                  : 'Broker Name : ${badges?.expertReff?.fullName}',
              style: Styles.circularStdRegular(context,
                  fontSize: 14, color: AppColors.greyTextColor)),
          4.y,
          Row(
            children: [
              AppText('Order for badge type : ',
                  style: Styles.circularStdMedium(context, fontSize: 14)),
              AppText(badges?.badgeReff?.title ?? "",
                  style: Styles.circularStdRegular(context,
                      fontSize: 14, color: AppColors.greyTextColor)),
            ],
          ),
          4.y,
          Row(
            children: [
              AppText('Status : ',
                  style: Styles.circularStdMedium(context, fontSize: 14)),
              AppText(badges?.status ?? "",
                  style: Styles.circularStdRegular(context,
                      fontSize: 14, color: AppColors.greyTextColor)),
              const Spacer(),
            ],
          ),
          10.y,
          isFromBusiness != true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      height: 38,
                      width: 80,
                      onTap: () {},
                      text: "Accept",
                      textSize: 13,
                    ),
                    CustomButton(
                      height: 38,
                      width: 80,
                      bgColor: AppColors.whiteColor,
                      onTap: () {},
                      text: "Cancel",
                      textColor: AppColors.blackColor,
                      textSize: 13,
                    )
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
