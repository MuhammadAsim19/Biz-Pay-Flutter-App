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
    this.prefixIcon,
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
    return ButtonTheme(
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
          hintStyle: Styles.circularStdRegular(context,
              color: FocusScope.of(context).hasFocus
                  ? AppColors.lightGreyColor
                  : AppColors.greyColor,
              fontSize: Data().textScale > 1.0 ? 12.sp : 15.sp,
              fontWeight: FontWeight.normal),
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
  final String? validatorText;
  final ValueChanged<String> onChanged;
  final double width;
  final double height;
  final bool? isBorder;
  final EdgeInsets? padding;
  final bool? isFit;
  final TextStyle? style;
  final Widget? icon;
  final String? Function(String?)? validator;
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
      this.validatorText,
      this.validator,
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

  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          DropdownButtonFormField<String>(
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
                      borderSide: BorderSide(
                          color: AppColors.lightGreyColor, width: 0.4.sp),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
              border: widget.isBorder != null
                  ? UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          color: AppColors.lightGreyColor, width: 0.4.sp),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
              disabledBorder: widget.isBorder != null
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.lightGreyColor, width: 0.4.sp),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
              focusedBorder: const UnderlineInputBorder(
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
                        style:
                            Styles.circularStdRegular(context, fontSize: 9.sp),
                      )),
              );
            }).toList(),
          ),
          validate
              ? AppText(
                  widget.validatorText ?? "",
                  style: Styles.circularStdRegular(context,
                      fontWeight: FontWeight.w400, color: AppColors.redColor),
                )
              : 10.x,
        ],
      ),
    );
  }
}

class DropDownField<T> extends StatelessWidget {
  const DropDownField(
      {required this.items,
      super.key,
      this.controller,
      required this.hints,
      this.icon,
      this.initial,
      this.onSelected,
      this.width,
      this.top = 8,
      this.errorText,
      this.title,
      this.color,
      this.searchEnable = true,
      this.borderRadius = 25});

  final List<DropItem<T>> items;
  final TextEditingController? controller;
  final String hints;
  final IconData? icon;
  final T? initial;
  final String? title;
  final void Function(T?)? onSelected;
  final double? width;
  final double top;
  final String? errorText;
  final Color? color;
  final bool searchEnable;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          top.y,
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 6).r,
              child: AppText(title!,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 13.sp,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      )),
            ),
          DropdownMenu<T>(
              width: width ?? MediaQuery.sizeOf(context).width * 0.9 - 8,
              enableFilter: true,
              controller: controller,
              hintText: hints,
              errorText: errorText,
              onSelected: onSelected,
              initialSelection: initial,
              // expandedInsets: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
              menuStyle: MenuStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                    color ?? AppColors.whiteColor,
                  )),
              textStyle: Styles.circularStdRegular(context,
                  color: AppColors.blackColor,
                  fontSize: Data().textScale > 1.0 ? 12.sp : 15.sp,
                  fontWeight: FontWeight.normal),
              selectedTrailingIcon: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.greyColor,
                size: 28.sp,
              ),
              trailingIcon: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.greyColor,
                size: 28.sp,
              ),
              requestFocusOnTap: searchEnable,
              inputDecorationTheme: Theme.of(context)
                  .inputDecorationTheme
                  .copyWith(
                    hintStyle: Styles.circularStdRegular(context,
                        color: AppColors.blackColor,
                        fontSize: Data().textScale > 1.0 ? 12.sp : 15.sp,
                        fontWeight: FontWeight.normal),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    enabledBorder:
                        outlineInputBorder(color: AppColors.blackColor),
                    focusedBorder:
                        outlineInputBorder(color: AppColors.primaryColor),
                    errorBorder: outlineInputBorder(color: Colors.red),
                    focusedErrorBorder: outlineInputBorder(color: Colors.red),
                  ),
              dropdownMenuEntries: items
                  .map((e) =>
                      DropdownMenuEntry<T>(value: e.value, label: e.label))
                  .toList()),
        ],
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 0.0).r,
        borderSide: BorderSide(
          color: color ?? AppColors.borderColor,
          width: 0.4.sp,
        ));
  }
}

class DropItem<T> {
  final String label;
  final T value;

  DropItem({
    required this.label,
    required this.value,
  });
}
