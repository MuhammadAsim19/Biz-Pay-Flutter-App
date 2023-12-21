

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PopMenu extends StatelessWidget {
  const PopMenu({super.key});

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
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Block user',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
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
