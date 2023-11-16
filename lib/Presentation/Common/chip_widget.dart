import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class ChipWidget extends StatelessWidget {
  final double? height;
  final double?  width;
  final  String? labelText;
  final Color? chipColor;
  final TextStyle? style;
  const ChipWidget({
    super.key, this.height, this.width, this.labelText, this.chipColor, this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 30.sp,
      child:   Chip(

        backgroundColor: AppColors.primaryColor,
        label: AppText(
          labelText??'Chat',
          style:style??Styles.circularStdRegular(context,color: AppColors.whiteColor),
        ),
      ),

    );
  }
}