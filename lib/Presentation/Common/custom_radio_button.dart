

import 'package:buysellbiz/Data/DataSource/Resources/colors_pallete.dart';
import 'package:buysellbiz/Data/DataSource/Resources/sized_box.dart';
import 'package:buysellbiz/Data/DataSource/Resources/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'app_text.dart';

class CustomRadioButtons extends StatefulWidget {
  final void Function(String) getCurrentValue;
  final bool? isBorderRequired;
  final EdgeInsetsGeometry buttonPadding;
  final String? initialValue;


  ///Accepts:List of Strings
  final List<String>? buttonList;
  const CustomRadioButtons({
    super.key,
    this.buttonPadding = EdgeInsets.zero,
    this.isBorderRequired = false,
    this.buttonList,
    required this.getCurrentValue, this.initialValue='',
  });

  @override
  State<CustomRadioButtons> createState() => _CustomRadioButtonsState();
}

class _CustomRadioButtonsState extends State<CustomRadioButtons> {
  String groupValue = '';

// List<String> temp
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
       // padding: const EdgeInsets.symmetric(vertical: 2).r,
       // margin: const EdgeInsets.symmetric(vertical: 8).r,
        decoration: BoxDecoration(
          // color: AppColors.whiteColor,
          border: Border.all(
            color: widget.isBorderRequired!
                ? AppColors.lightGreyColor
                : Colors.transparent,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (String button in widget.buttonList!)
                radioListTile(
                    text: button, value: button, padding: widget.buttonPadding),
              SizedBox(height: 10.sp,)
            ],
          ),
        ),
      ),
    );
  }

  Widget radioListTile(
      {required String text,
        required String value,
        required EdgeInsetsGeometry padding}) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          Expanded(
            flex: 2,
            child: AppText(
              text,
              style: Styles.circularStdRegular(
                context,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600

              ),
            ),
          ),
        CustomSizedBox.width(1.sw/3),
          Expanded(
            child: Material(
             // elevation: 2,
              color: Colors.transparent,
              child: Radio(
                activeColor: AppColors.primaryColor,

                //visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                value: value,
                groupValue: groupValue==""?widget.initialValue:groupValue,
                onChanged: (val) {
                  setState(() {
                    groupValue = val.toString();
                    if (val != null) {}
                    widget.getCurrentValue(val!);
                  });
                },
              ),
            ),
          ),
          // SizedBox(
          //   width: 60.w,
          // ),
        ],
      ),
    );
  }
}
