import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class ChipWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String? labelText;
  final Color? chipColor;
  final Color? textColor;

  const ChipWidget(
      {super.key,
      this.height,
      this.width,
      this.labelText,
      this.chipColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: height ?? 30.sp,
          width: width,
          child: Chip(
            padding: EdgeInsets.only(bottom: 2.sp, left: 5.sp, right: 5.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
                side: const BorderSide(color: Colors.transparent)),
            backgroundColor: chipColor ?? AppColors.chipColor,
            label: AppText(
              labelText ?? 'Chat',
              style: Styles.circularStdRegular(context,
                  color: textColor ?? AppColors.blackColor, fontSize: 13.sp),
            ),
          ),
        ),
        5.x,
      ],
    );
  }
}
