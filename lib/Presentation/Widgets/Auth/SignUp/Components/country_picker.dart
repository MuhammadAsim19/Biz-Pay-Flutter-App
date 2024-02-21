import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CountryPicker extends StatefulWidget {
  final TextEditingController controller;
  final bool onTapField;
  final bool isBorderRequired = true;
  final String? Function(String?) countrySelect;
  final String? Function(String?)? validator;
  final String? initialSelection;

  const CountryPicker(
      {super.key,
      required this.controller,
      required this.onTapField,
      required this.countrySelect,
      this.initialSelection,
      this.validator});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  FocusNode focusNode = FocusNode();

  String code = '+1';

  @override
  void initState() {
    focusNode.unfocus();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.initialSelection);

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (focusNode
    //       .hasFocus && widget.controller.text == '') {
    //     FocusScope.of(context).unfocus();
    //   }
    // });

    return TextFormField(
      keyboardType: TextInputType.phone,
      onFieldSubmitted: (value) {},
      // onTap: () {
      //   // widget.controller.text = code;
      // },
      style: Styles.circularStdRegular(context,
          // color: FocusScope.of(context).hasFocus ? hintTextColor :AppColors.greyColor,
          fontSize: Data().textScale > 1.0 ? 12.sp : 16.sp,
          fontWeight: FontWeight.w400),
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          fillColor: AppColors.whiteColor,
          filled: true,
          hintText: 'Phone Number',
          prefixIcon: SizedBox(
            height: 40.h,
            width: 110.w,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: CountryCodePicker(
                    initialSelection: widget.initialSelection ?? "US",
                    onChanged: (value) {
                      code = value.dialCode ?? "";
                      widget.countrySelect(value.dialCode);
                      print(code);
                    },
                    // onInit: (value) {
                    //   code = value!.dialCode ?? "";
                    //   setState(() {});
                    // },

                    favorite: const ['+1', 'US'],
                    // dialogTextStyle: Styles.circularStdRegular(context,
                    //     color: FocusScope.of(context).hasFocus
                    //         ? AppColors.blackColor
                    //         : AppColors.blackColor,
                    //     fontSize: Data().textScale > 1.0 ? 12.sp : 14.sp,
                    //     fontWeight: FontWeight.w400),
                    // flagWidth: 20.sp,

                    // textStyle: Styles.circularStdRegular(context,
                    //     color: FocusScope
                    //         .of(context)
                    //         .hasFocus
                    //         ? AppColors.blackColor
                    //         : AppColors.blackColor,
                    //     fontSize: Data().textScale > 1.0 ? 12.sp : 14.sp,
                    //     fontWeight: FontWeight.w400),
                    showFlag: true,
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Container(
                    margin: EdgeInsets.only(top: 8.sp, bottom: 8.sp),
                    child: const VerticalDivider(
                      thickness: 1,
                      color: AppColors.greyLightColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          hintStyle: Styles.circularStdRegular(context,
              // color: FocusScope.of(context).hasFocus ? hintTextColor :AppColors.greyColor,
              fontSize: Data().textScale > 1.0 ? 12.sp : 16.sp,
              fontWeight: FontWeight.w400),

          ///changess
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 12,
          ).r,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: BorderSide(
              color: widget.isBorderRequired ? Colors.red : Colors.transparent,
            ),
          ),
          errorBorder: widget.isBorderRequired
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                )
              : outlineInputBorder(),
          border: widget.isBorderRequired
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                )
              : outlineInputBorder(),
          focusedBorder: widget.isBorderRequired
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                )
              : outlineInputBorder(),
          enabledBorder: widget.isBorderRequired
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  borderSide: const BorderSide(
                    width: 0.3,
                    color: AppColors.lightGreyColor,
                  ),
                )
              : outlineInputBorder()),
      controller: widget.controller,
      // decoration: InputDecoration(
      //   contentPadding: EdgeInsets.symmetric(vertical: 2),
      //
      // ));
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25 ?? 12.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
