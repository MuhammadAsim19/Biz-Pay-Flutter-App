// ignore: must_be_immutable

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

import 'app_shadow.dart';

class CustomDropDownWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final String hintText;
  dynamic value;
  final double vMargin;
  final double hMargin;
  final double? dropDownHeight;
  final String validationText;
  final ValueChanged onChanged;
  final List<DropdownMenuItem<Object>> itemsMap;
  final bool isBorderRequired;
  final bool isShadowRequired;

  CustomDropDownWidget({
    super.key,
    this.hMargin = 8,
    this.vMargin = 0,
    this.dropDownHeight,
    required this.prefixIcon,
    required this.hintText,
    required this.value,
    required this.validationText,
    required this.onChanged,
    required this.itemsMap,
    this.isBorderRequired = true,
    this.isShadowRequired = false,
  });

  final double borderRadius = 25;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.transparent,
          boxShadow: isShadowRequired ? [AppShadow.normal()] : []),
      padding: EdgeInsets.symmetric(vertical: vMargin, horizontal: hMargin).r,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(15),
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          menuMaxHeight: dropDownHeight,
          validator: (value) {
            if (value == null) {
              return validationText;
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIconConstraints: BoxConstraints(
              maxHeight: 50.h,
              maxWidth: 50.w,
              minHeight: 20.h,
              minWidth: 23.w,
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(left: 15.sp),
                    child: prefixIcon,
                  )
                : null,
            errorMaxLines: 1,
            contentPadding: EdgeInsets.only(
              top: 10,
              bottom: 15,
              left: prefixIcon != null ? 8 : 6,
              right: prefixIcon != null ? 10 : 12,
            ),

            // EdgeInsets.symmetric(
            //   vertical: 13,
            //   horizontal: prefixIcon != null ? 10 : 6,
            // ).r,
            hintStyle: Styles.circularStdRegular(
              context,
              color: AppColors.blackColor,
              fontSize: 14.sp,
            ),
            errorBorder: isBorderRequired
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius).r,
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 0.4.sp,
                    ))
                : outlineInputBorder(),
            enabledBorder: isBorderRequired
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius).r,
                    borderSide: BorderSide(
                      color: AppColors.lightGreyColor,
                      width: 0.4.sp,
                    ))
                : outlineInputBorder(),
            focusedBorder: isBorderRequired
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius).r,
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 0.4.sp,
                    ))
                : outlineInputBorder(),
            focusedErrorBorder: isBorderRequired
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius).r,
                    borderSide: BorderSide(
                      width: 0.4.sp,
                      color: AppColors.lightGreyColor,
                    ))
                : outlineInputBorder(),
          ),
          hint: Text(
            hintText,
            style: Styles.circularStdRegular(
              context,
              color: AppColors.blackColor,
              fontSize: 14.sp,
            ),
          ),
          dropdownColor: Colors.white,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.greyColor,
          ),
          iconSize: 28.r,
          isExpanded: true,
          style: Styles.circularStdRegular(
            context,
            fontSize: 14.sp,
            color: AppColors.blackColor,
          ),
          value: value,
          onChanged: onChanged,
          items: itemsMap,
        ),
      ),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}

class GeneralizedDropDown extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String> onChanged;
  final double width;
  final double height;
  final bool? isBorder;
  final EdgeInsets? padding;
  final bool? isFit;
  final TextStyle? style;
  final Widget? icon;
  final String? hint;

  const GeneralizedDropDown(
      {Key? key,
      required this.items,
      required this.selectedValue,
      required this.onChanged,
      this.width = 20,
      this.height = 20,
      this.padding,
      this.isBorder,
      this.isFit,
      this.style,
      this.icon,
      this.hint})
      : super(key: key);

  @override
  State<GeneralizedDropDown> createState() => _GeneralizedDropDownState();
}

class _GeneralizedDropDownState extends State<GeneralizedDropDown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      isExpanded: true,
      hint: AppText(
        widget.hint ?? "",
        style: Styles.circularStdRegular(context, fontSize: 15),
      ),
      elevation: 0,
      icon: widget.icon,
      // icon: ,
      autofocus: false,
      padding: widget.padding,
      onChanged: (value) {
        setState(() {
          _selectedValue = value!;
          widget.onChanged(value);
        });
      },
      decoration: InputDecoration(
        enabledBorder: widget.isBorder != null
            ? UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.lightGreyColor, width: 0.4.sp),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
        border: widget.isBorder != null
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide:
                    BorderSide(color: AppColors.lightGreyColor, width: 0.4.sp),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
        disabledBorder: widget.isBorder != null
            ? UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.lightGreyColor, width: 0.4.sp),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: widget.isFit != null
              ? AppText(item,
                  style: widget.style ??
                      Styles.circularStdRegular(context, fontSize: 9.sp))
              : FittedBox(
                  child: AppText(
                  item,
                  style: Styles.circularStdRegular(context, fontSize: 9.sp),
                )),
        );
      }).toList(),
    );
  }
}
