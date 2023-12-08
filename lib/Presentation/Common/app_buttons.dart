import 'package:buysellbiz/Data/DataSource/Resources/colors_pallete.dart';
import 'package:buysellbiz/Data/DataSource/Resources/sized_box.dart';
import 'package:buysellbiz/Data/DataSource/Resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_text.dart';
import 'image_widgets.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color bgColor;
  final Color textColor;
  final Color? iconColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? horizontalMargin;
  final double? verticalMargin;
  final TextStyle? textStyleButton;

  ///must be Asset Image
  final String? trailingIcon;

  ///must be Asset Image
  final String? leadingIcon;
  final double? imageWidth;
  final double? imageHeight;
  final bool isBorder;
  final Color? borderColor;
  final FontWeight? textFontWeight;
  final double? textSize;
  final bool? leadingSvgIcon;
  final double? trailIconWidth;
  final double? borderThickness;
  final double? trailIconHeight;
  final double? gapWidth;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool? isButtonAlignLeft;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.horizontalPadding = 10,
    this.verticalPadding = 10,
    this.horizontalMargin = 1,
    this.verticalMargin = 1,
    this.trailingIcon,
    this.iconColor,
    this.isBorder = true,
    this.leadingIcon,
    this.leadingSvgIcon,
    this.imageWidth = 22,
    this.imageHeight = 25,
    this.width,
    this.height,
    this.borderRadius,
    this.isButtonAlignLeft,
    this.borderColor = AppColors.primaryColor,
    this.textFontWeight,
    this.textSize,
    // this.borderColor = AppColors.primaryColor, this.textFontWeight, this.textSize, this.trailIconWidth,
    this.borderThickness,
    this.trailIconHeight,
    this.gapWidth,
    this.trailIconWidth,
    this.textStyleButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        height: height ?? (1.sw > 500 ? 100 : 50),
        width: width,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin!,
          vertical: verticalMargin!,
        ).r,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding!,
          vertical: verticalPadding!,
        ).r,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10).r,
          border: isBorder
              ? Border.all(
                  color: borderColor!,
                  width: borderThickness ?? 1.w,
                )
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize:
                isButtonAlignLeft == true ? MainAxisSize.max : MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leadingIcon != null
                  ? leadingSvgIcon != null
                      ? SvgPicture.asset(
                          leadingIcon!,
                          color: iconColor,
                          width: imageWidth,
                          height: imageHeight,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: AssetImageWidget(
                            url: leadingIcon!,
                            color: iconColor,
                            width: imageWidth,
                            height: imageHeight,
                          ),
                        )
                  : Container(),
              CustomSizedBox.width(gapWidth ?? 0),
              AppText(
                text,
                style: textStyleButton ??
                    Styles.circularStdRegular(context,
                        color: textColor,
                        fontSize: textSize ?? 16.sp,
                        fontWeight: textFontWeight ?? FontWeight.w500),
              ),
              trailingIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: AssetImageWidget(
                        url: trailingIcon!,
                        width: trailIconWidth ?? 22,
                        height: trailIconHeight ?? 22,
                        color: iconColor,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
