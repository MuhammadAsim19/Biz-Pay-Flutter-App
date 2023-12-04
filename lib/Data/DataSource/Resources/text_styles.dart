import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_pallete.dart';

extension Scale on BuildContext {
  double get textScale => MediaQuery.of(this).textScaleFactor;
}

class Styles {
  static double _textScale(
    BuildContext context,
  ) {
    //print(MediaQuery.of(context).textScaleFactor);
    return MediaQuery.of(context).textScaleFactor > 1.0
        ? 0.9
        : MediaQuery.of(context).textScaleFactor;
  }

  // static TextStyle plusJakartaSansBlack(BuildContext context,
  //     {double? fontSize, Color? color}) {
  //   return TextStyle(
  //     fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
  //     color: color ?? AppColors.blackColor,
  //     fontFamily: "Lato Black",
  //   );
  // }

  static TextStyle circularStdBold(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      double? letterSpacing}) {
    return TextStyle(
        fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.blackColor,
        fontFamily: "circularStd Bold",
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  // static TextStyle plusJakartaSansLight(BuildContext context,
  //     {double? fontSize, Color? color}) {
  //   return TextStyle(
  //     fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
  //     color: color ?? AppColors.blackColor,
  //     fontFamily: "PlusJakartaSans Light",
  //   );
  // }

  static TextStyle circularStdRegular(BuildContext context,
      {double? fontSize,
      Color? color,
      double height = 1.4,
      FontWeight? fontWeight,
      double? letterSpacing}) {
    return TextStyle(
        letterSpacing: letterSpacing ?? 0,
        fontSize: (fontSize ?? 12.0.sp) * _textScale(context),
        color: color ?? AppColors.blackColor,
        fontFamily: "CircularStd Regular",
        height: height,
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  static TextStyle circularStdMedium(BuildContext context,
      {double? fontSize, Color? color}) {
    return TextStyle(
        fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
        color: color ?? AppColors.blackColor,
        fontFamily: "CircularStd Medium",
        fontWeight: FontWeight.w400);
  }
}
