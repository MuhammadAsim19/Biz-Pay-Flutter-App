import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class AuthButtons extends StatelessWidget {
  final double? height;
  final double? width;
  final String? image;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? radius;
  final VoidCallback? onTap;
  final bool? isBorderRequired;

  const AuthButtons(
      {super.key,
      this.color,
      this.width,
      this.height,
      this.image,
      this.onTap,
      this.isBorderRequired,
      this.textColor,
      this.text,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 25.sp).r,
          color: color ?? Colors.white,
          border: Border.all(
              color: isBorderRequired == true
                  ? AppColors.borderColor
                  : AppColors.whiteColor),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image ?? ""),
              10.x,
              AppText(text ?? "",
                  style: Styles.circularStdMedium(context, color: textColor))
            ],
          ),
        ),
      ),
    );
  }
}
