import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'ChatModel/chat_tile_model.dart';
import 'chat_details.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, this.data, this.tileData});

  final ChatTileModel? data;
  final ChatTileApiModel? tileData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //InboxRepo.socket.disconnect();
        // Navigate.to(context, ChatDetailsScreen(modelId: data, chatDto: tileData));
      },
      child: Container(
        padding: EdgeInsets.all(13.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.borderColor)),
        child: Row(
          children: [
            CachedNetworkImage(
              height: 50.h,
              width: 50.w,
              imageUrl: "${ApiConstant.baseUrl}${tileData!.profilePic}",
            ),
            15.x,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(tileData?.username ?? "",
                      style: Styles.circularStdBold(context,
                          fontSize: 16.sp, fontWeight: FontWeight.w500)),
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
                AppText(data!.updatedAt.toString(),
                    style: Styles.circularStdRegular(context,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyTextColor)),
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
      ),
    );
  }
}
