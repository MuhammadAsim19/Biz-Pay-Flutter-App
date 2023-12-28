

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/block_repo/block_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxControllers.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PopMenu extends StatelessWidget {
  final ChatTileApiModel? chDto;
  const PopMenu({super.key, required this.chDto});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      //padding: EdgeInsets.zero,

      position: PopupMenuPosition.under,
      color: Colors.white,
      elevation: 0,
      offset: Offset(-15.sp, 10.sp),
      constraints: BoxConstraints(
          minWidth: 140.sp,
          maxWidth: 140.sp,
          minHeight: 80.sp,
          maxHeight: 80.sp),
      enabled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: const BorderSide(color: AppColors.borderColor)),
      onSelected: (value) async {
        print(value);
        if(value == MenuItem1.block)


        {

          var data={

            "isBlocked":InboxControllers.blockedStatus.value==true?false:true,
            "blockedBy":"6579ea61d76f7a30f94f5c80",
            "blockedTo":InboxControllers.chatDetailData.value.receiver.toString().trim(),
            "conversationId":chDto?.id.toString()


          };
          // var staticData={
          //   "isBlocked": false ,
          //   "blockedBy": "6579ea61d76f7a30f94f5c80",
          //   "blockedTo": "6579f21c00996aa38f7c7a2b",
          //   "conversationId": "658a7e4bc7d312d5ed0b796f"
          // };

  InboxRepo.socket.emit('blockUser',data);
  // await BlockRepo().blockUser(body: data).then((value) {
  //   print("api----data");
  //
  //   print(value);
  //
  // });



}
        // if (value == MenuItem.edit) {
        //   // ///logic for edit
        // }
      },
      child: SizedBox(
        height: 40.sp,
        width: 40.sp,
        child: SvgPicture.asset(
          Assets.threeDots,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: MenuItem1.report,
          padding: EdgeInsets.only(left: 10.sp, top: 5.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    'assets/images/report.svg',
                  )),
              4.x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Report user',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),

        //delete
        PopupMenuItem(
          value: MenuItem1.block,
          padding: EdgeInsets.only(left: 10.sp, top: 10.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    'assets/images/block.svg',
                  )),
              4.x,
              Expanded(
                flex: 4,
                child: ValueListenableBuilder(
                  builder: (context,blockedState,sss) {
                    return Padding(
                      padding: EdgeInsets.only(left: 2.sp),
                      child: AppText(
                        blockedState==true?'Unblock User':'Block user',
                        style: Styles.circularStdMedium(context, fontSize: 16.sp),
                        textAlign: TextAlign.left,
                      ),
                    );
                  }, valueListenable: InboxControllers.blockedStatus,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


enum MenuItem1 {
  report,
  block,
}
