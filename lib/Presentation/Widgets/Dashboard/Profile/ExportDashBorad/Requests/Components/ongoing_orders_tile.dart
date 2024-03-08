import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/request_detail_screen.dart';

class OngoingOrders extends StatelessWidget {
  const OngoingOrders({super.key, this.badges});

  final BadgesRequest? badges;

  @override
  Widget build(BuildContext context) {
    log("Here is Badges ${badges?.toJson()}");

    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return const AddDelivery();
        //   },
        // ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
                badges?.businessReff != null
                    ? badges?.businessReff?.name ?? ""
                    : badges?.userReff?.fullName ?? "",
                style: Styles.circularStdMedium(context, fontSize: 16)),
            4.y,
            AppText('status : ${badges?.status}',
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
                AppText('Order time : ',
                    style: Styles.circularStdMedium(context, fontSize: 14)),
                AppText('2 days Ago',
                    style: Styles.circularStdRegular(context,
                        fontSize: 14, color: AppColors.greyTextColor)),
                const Spacer(),
                CustomButton(
                    height: 38,
                    width: 70,
                    onTap: () {},
                    text: 'Chat',
                    borderRadius: 25,
                    textSize: 13),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
