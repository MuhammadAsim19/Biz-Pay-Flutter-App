import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CountryPicker extends StatefulWidget {
  final TextEditingController controller;
  bool onTapField;

  CountryPicker(
      {super.key, required this.controller, required this.onTapField});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.unfocus();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (focusNode
    //       .hasFocus && widget.controller.text == '') {
    //     FocusScope.of(context).unfocus();
    //   }
    // });

    return Container(
      height: 43.h,
      width: 1.sw,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(
              color: widget.onTapField
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
            initialSelection: 'US',
            // favorite: ['+39', 'FR'],
            // optional. Shows only country name and flag
            showCountryOnly: false,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0, top: 8.sp, bottom: 8.sp),
            child: const VerticalDivider(
              color: AppColors.greyTextColor,
            ),
          ),
          Expanded(
              flex: 3,
              child: TextFormField(
                // validator: (v) {
                //   if (v!.trim().isEmpty) {
                //     return 'Phone Required';
                //   }
                //   return null;
                // },

                onTap: () {
                  widget.onTapField = true;
                  setState(() {});
                },
                onTapOutside: (val) {
                  widget.onTapField = false;

                  // focusNode.unfocus();
                  setState(() {});
                },
                // focusNode: focusNode,
                controller: widget.controller,
                decoration: const InputDecoration(
                  hintText: 'Phone',
                  border: InputBorder.none,
                ),
              )),
        ],
      ),
    );
  }
}
