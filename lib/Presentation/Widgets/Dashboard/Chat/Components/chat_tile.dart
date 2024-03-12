import 'dart:developer';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, this.tileData});

  //final ChatTileModel? data;
  final ChatTileApiModel? tileData;

  @override
  Widget build(BuildContext context) {
    print("${tileData!.badges!.toList()}");

    return Container(
      padding: EdgeInsets.all(13.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.borderColor)),
      child: Row(
        children: [
          CachedImage(
            isCircle: true,
            radius: 30.sp,
            height: 10.h,
            width: 10.w,
            url: tileData!.profilePic!.contains('https')
                ? "${tileData!.profilePic}"
                : "${ApiConstant.baseurl}${tileData!.profilePic}",
          ),
          15.x,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(tileData?.username ?? "",
                    style: Styles.circularStdBold(context,
                        fontSize: 16.sp, fontWeight: FontWeight.w500)),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      for (int i = 0; i < tileData!.badges!.length; i++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.sp),
                          padding: EdgeInsets.all(5.sp),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedImage(
                            radius: 20.sp,
                            url:
                                "${ApiConstant.baseurl}/${tileData!.badges![i].icon}",
                          ),
                        ),
                    ],
                  ),
                ),
                2.y,
                AppText(tileData?.businessReff?.name ?? "",
                    style: Styles.circularStdRegular(context,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor)),
                2.y,
                AppText(tileData?.lastMessage?.content ?? "",
                    style: Styles.circularStdRegular(context,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyTextColor)),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              20.y,
              tileData!.unreadMessages! > 0
                  ? CircleAvatar(
                      radius: 10.sp,
                      child: Center(
                        child: AppText(
                          tileData!.unreadMessages.toString(),
                          style: Styles.circularStdRegular(context,
                              color: AppColors.whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
