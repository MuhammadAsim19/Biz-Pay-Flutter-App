import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/ContextWidgets/bottom_sheet.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterButtons extends StatelessWidget {
  FilterButtons({super.key, this.onTap, this.value});

  String? value;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: 150,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEF1F6),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEEF1F6)),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Center(
          child: Row(
            children: [
              AppText(
                value!,
                style: Styles.circularStdRegular(context,
                    color: const Color(0xFFB0B0B0)),
                overflow: TextOverflow.ellipsis,
              ),
              5.x,
              const Icon(
                Icons.arrow_drop_down,
                color: AppColors.blackColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
