import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/ContextWidgets/bottom_sheet.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterButtons extends StatelessWidget {
  FilterButtons({super.key, this.onChange, this.value});

  String? value;
  Function(double val)? onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomBottomSheet().showBottomSheet(context,
            StatefulBuilder(builder: (context, state) {
          double value1 = 10;
          return SizedBox(
            height: 1.sh / 2,
            width: 1.sw,
            child: Center(
              // ignore: missing_required_param
              child: SfSlider(
                onChangeEnd: (va) {
                  Navigator.pop(context);
                },
                activeColor: AppColors.primaryColor,
                min: 0.0,
                max: 500.0,
                value: value1,
                interval: 100,
                showTicks: false,
                showLabels: true,
                onChanged: (value) {
                  print(value);
                  state(() {
                    value = value;
                  });
                  onChange!(value);
                },
              ),
            ),
          );
        }));
      },
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
