import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/request_detail_screen.dart';

class RequestTile extends StatelessWidget {
  const RequestTile(
      {super.key, required this.badgesRequest, required this.isFromBusiness});

  final BadgesRequest badgesRequest;
  final bool isFromBusiness;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (badgesRequest.status != "rejected") {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return RequestDetailScreen(
                badges: badgesRequest,
                isFromBusiness: isFromBusiness,
              );
            },
          ));
        }
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
            badgesRequest.businessReff?.name != null
                ? AppText(badgesRequest.businessReff?.name ?? "",
                    style: Styles.circularStdMedium(context, fontSize: 16))
                : 1.y,
            4.y,
            AppText(
                isFromBusiness != true
                    ? 'Customer Name : ${badgesRequest.userReff?.fullName}'
                    : 'Expert Name : ${badgesRequest.expertReff?.fullName}',
                style: Styles.circularStdRegular(context,
                    fontSize: 14, color: AppColors.greyTextColor)),
            4.y,
            Row(
              children: [
                AppText('Order for badge type : ',
                    style: Styles.circularStdMedium(context, fontSize: 14)),
                AppText(badgesRequest?.badgeReff?.title ?? "",
                    style: Styles.circularStdRegular(context,
                        fontSize: 14, color: AppColors.greyTextColor)),
              ],
            ),
            4.y,
            Row(
              children: [
                AppText('Status : ',
                    style: Styles.circularStdMedium(context, fontSize: 14)),
                AppText(badgesRequest?.status ?? "",
                    style: Styles.circularStdRegular(context,
                        fontSize: 14, color: AppColors.greyTextColor)),
                const Spacer(),
              ],
            ),
            // 10.y,
            // Row(
            //   children: [
            //     SvgPicture.asset(
            //       Assets.pdfIcon,
            //       width: 30,
            //       height: 30,
            //     ),
            //     10.x,
            //     Expanded(
            //       flex: 3,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           AppText(
            //               badgesRequest?.attachment != null
            //                   ? badgesRequest!.attachment!.split('/').last
            //                   : "",
            //               maxLine: 2,
            //               style: Styles.circularStdMedium(context,
            //                   fontSize: 13.sp)),
            //         ],
            //       ),
            //     ),
            //     const Spacer(),
            //     InkWell(
            //         onTap: () async {
            //           badgesRequest?.attachment != null
            //               ? await DownloadFile.download(
            //                   badgesRequest!.attachment!, context)
            //               : null;
            //         },
            //         child: SvgPicture.asset(Assets.downloadIcon))
            //   ],
            // ),

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
