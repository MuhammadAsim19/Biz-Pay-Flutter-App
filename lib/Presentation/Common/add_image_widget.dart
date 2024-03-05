import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:dotted_border/dotted_border.dart';

class AddImageWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? addText;
  final double? height;
  final double? width;
  final String? text;
  final String? attachFile;
  final TextStyle? style;

  const AddImageWidget({
    super.key,
    required this.onTap,
    this.addText,
    this.height,
    this.width,
    this.text,
    this.style,
    this.attachFile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: height ?? (1.sw > 500 ? 100 : 76),
        width: width ?? 1.sw,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12).r,
            //  padding: const EdgeInsets.symmetric(vertical: 35).r,
            color: AppColors.greyColor,
            strokeWidth: 3,
            stackFit: StackFit.expand,
            dashPattern: const [3, 4],
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                color: AppColors.dottedGreyColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    10.y,
                    SvgPicture.asset(
                      attachFile ?? Assets.addImageIcon,
                      height: 20,
                      width: 20,
                    ),
                    CustomSizedBox.height(4),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6).r,
                        child: AppText(
                          text ?? "Uploads photos",
                          style: style ??
                              Styles.circularStdRegular(
                                context,
                                fontSize: 12.sp,
                                color: AppColors.blackColor,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
