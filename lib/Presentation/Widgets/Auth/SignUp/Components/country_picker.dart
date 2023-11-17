import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CountryPicker extends StatelessWidget {

  final FocusNode? focusNode;
  final TextEditingController? controller;

  CountryPicker({super.key, this.focusNode, this.controller});


  @override
  Widget build(BuildContext context) {
    print(FocusScope
        .of(context)
        .hasFocus);

    return Container(
      height: 43.h,
      width: 1.sw,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(
              color: FocusScope
                  .of(context)
                  .hasFocus
                  ? AppColors.primaryColor
                  : AppColors.greyLightColor)),
      child: Row(
        children: [
          const CountryCodePicker(
            hideMainText: false,
            showFlagMain: true,
            showFlag: true,
            hideSearch: true,
            onChanged: print,
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'IT',
            favorite: ['+39', 'FR'],
            // optional. Shows only country name and flag
            showCountryOnly: false,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
          Expanded(
              child: TextFormField(
                controller: controller,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              )),
        ],
      ),
    );
  }
}
