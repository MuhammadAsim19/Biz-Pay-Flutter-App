import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';


class CustomRadioSelectionTile extends StatelessWidget {
  final String title;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic?) onChanged;
  final String number;

  const CustomRadioSelectionTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged, required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Material(
            borderRadius: BorderRadius.circular(10.r),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              alignment: Alignment.centerRight,
              width: 1.sw,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: value == groupValue
                      ? AppColors.primaryColor
                      : Colors.transparent,
                ),
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                 Row(
                   children: [

                     Radio<dynamic>(
                       activeColor: AppColors.primaryColor,
                       value: value,
                       groupValue: groupValue,
                       onChanged: onChanged,
                     ),
                     AppText(number, style: Styles.circularStdMedium(context)),
                   ],
                 ),
                  AppText(title,
                      style: Styles.circularStdBold(context,
                          color: value == groupValue
                              ? AppColors.primaryColor
                              : AppColors.blackColor)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
