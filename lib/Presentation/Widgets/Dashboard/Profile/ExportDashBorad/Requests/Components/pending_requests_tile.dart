import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/download_file.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Components/add_delivery.dart';

class AcceptedOrders extends StatelessWidget {
  const AcceptedOrders({super.key, this.badges, this.isFromBusiness});

  final BadgesRequest? badges;
  final bool? isFromBusiness;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AddDelivery(
              badges: badges,
            );
          },
        ));
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
            Row(
              children: [
                SvgPicture.asset(
                  Assets.pdfIcon,
                  width: 30,
                  height: 30,
                ),
                10.x,
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          badges?.attachment != null
                              ? badges!.attachment!.split('/').last
                              : "",
                          maxLine: 2,
                          style: Styles.circularStdMedium(context,
                              fontSize: 13.sp)),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                    onTap: () async {
                      badges?.attachment != null
                          ? await DownloadFile.download(
                              badges!.attachment!, context)
                          : null;
                    },
                    child: SvgPicture.asset(Assets.downloadIcon))
              ],
            ),
            // isFromBusiness != true
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           CustomButton(
            //             height: 38,
            //             width: 80,
            //             onTap: () {},
            //             text: "Accept",
            //             textSize: 13,
            //           ),
            //           CustomButton(
            //             height: 38,
            //             width: 80,
            //             bgColor: AppColors.whiteColor,
            //             onTap: () {},
            //             text: "Cancel",
            //             textColor: AppColors.blackColor,
            //             textSize: 13,
            //           )
            //         ],
            //       )
            //     : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
