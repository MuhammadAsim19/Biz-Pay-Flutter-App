


import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/video_preiveie.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inbox_detail_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';

import 'ChatModel/chat_message_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cached_network_image/cached_network_image.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key, this.modelData,  this.chatDto, this.senderId});

  final ChatMessageModel? modelData;
  final  Message? chatDto;
  final String? senderId;

  @override
  Widget build(BuildContext context) {
   // print("http://192.168.1.17:9000${chatDto!.images![0]}");
    return SingleChildScrollView(
      child: Align(
        alignment: chatDto!.sender == senderId
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
         // height: 1.sh/5,
          width: 260,
          margin: EdgeInsets.only(top: 10.sp),
          color:  chatDto!.images!.isNotEmpty?

               AppColors.borderColor:null,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              10.y,
              chatDto!.images!.isNotEmpty?

                  Align(
                      alignment: chatDto!.sender == senderId
                          ? Alignment.centerRight
                          : Alignment.centerLeft,

                      child: Container(height: 250,width: 250,

                        color: chatDto!.sender != senderId
                            ? AppColors.chatColor
                            : AppColors.borderColor,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Center(
                            child: Wrap(
                             //alignment: WrapAlignment.spaceEvenly,
                            //runSpacing: 2,
                              spacing: 2,
                            alignment: WrapAlignment.spaceEvenly,

                            //verticalDirection: VerticalDirection.up,

                            children: chatDto!.images!.map((e) {
                            print("${ApiConstant.baseUrl}$e");
                              return CachedImage(url: "${ApiConstant.baseUrl}$e",fit: BoxFit.fill
                                ,isCircle: false,
                              height: chatDto!.images!.length>2?null:250,
                                width: chatDto!.images!.length>1?110:250,
                              );

                            }).toList(),

                                              ),
                          ),
                        ),))
                  :const SizedBox(),
          10.y,
              chatDto!.videos!.isNotEmpty?

              Align(
                  alignment: chatDto!.sender == senderId
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(height: 250,width: 250,

                    color: chatDto!.sender != senderId
                        ? AppColors.chatColor
                        : AppColors.borderColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        height: 250,
                        width: 250,
                        child: Center(
                          child: Wrap(
                            //alignment: WrapAlignment.spaceEvenly,
                            //runSpacing: 2,
                            spacing: 2,
                            alignment: WrapAlignment.spaceEvenly,

                            //verticalDirection: VerticalDirection.up,

                            children: chatDto!.videos!.map((e) {
                              print("${ApiConstant.baseUrl}$e");


                              return Container(
                                  color: AppColors.productTileColor,

                                  child:  GestureDetector(
                                      
                                      onTap: (){
                                        
                                        Navigate.to(context,VideoPreview(url: "${ApiConstant.baseUrl}$e"));
                                      },
                                      child: const  Icon(Icons.play_circle_outline,size: 100,)));



                            }).toList(),

                          ),
                        ),
                      ),
                    ),))
                  :const SizedBox(),
              10.y,
              Align(
                alignment: chatDto!.sender == senderId
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(


                  padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                  decoration: BoxDecoration(
                    borderRadius: chatDto!.sender != senderId
                        ? BorderRadius.only(
                            bottomRight: Radius.circular(10.sp),
                            topLeft: Radius.circular(10.sp),
                            topRight: Radius.circular(10.sp))
                        : BorderRadius.only(
                            topLeft: Radius.circular(10.sp),
                            topRight: Radius.circular(10.sp),
                            bottomLeft: Radius.circular(10.sp),
                          ),
                    color: chatDto!.sender != senderId
                        ? AppColors.chatColor
                        : AppColors.primaryColor,
                  ),
                  child:
                       Text(chatDto!.content ?? "",
                          textScaleFactor: 1,
                          style: Styles.circularStdRegular(context,
                              color: chatDto!.sender != senderId
                                  ? AppColors.blackColor
                                  : AppColors.whiteColor)),
                ),
              ),
              8.y,
              Align(
                alignment: chatDto!.sender != senderId
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: AppText(chatDto!.createdAt!.toHourAndMinutes
                  ,
                    style: Styles.circularStdRegular(context,
                        color: AppColors.greyTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
