import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:flutter/services.dart';

class CustomDatePickerValidateWidget extends StatefulWidget {
  // final String imageUrl;
  final String? validationText;
  final TextEditingController controller;

  final bool isBorderRequired;
  final bool isShadowRequired;
  final bool? isSuffix;
  final double vMargin;
  final double hMargin;
  final String? Function(String?)? validator;
  Widget? prefixIcon;
  Widget? suffixIcon;
  double? sHeight;
  double? sWidth;
  double? pHeight;
  double? pWidth;
  String? hintText;

  final EdgeInsets? contentPadding;

  // final String? Function(String?)? validator;
  CustomDatePickerValidateWidget(
      {super.key,
      // required this.text,
      // required this.imageUrl,
      // required this.dateTime,
      this.vMargin = 8,
      this.hMargin = 0,
      this.isBorderRequired = true,
      this.isShadowRequired = false,
      this.hintText,
      required this.validator,
      this.isSuffix = false,
      this.validationText,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.sHeight,
      this.sWidth,
      this.pHeight,
      this.pWidth,
      this.contentPadding});

  @override
  State<CustomDatePickerValidateWidget> createState() =>
      _CustomDatePickerValidateWidgetState();
}

class _CustomDatePickerValidateWidgetState
    extends State<CustomDatePickerValidateWidget> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWithOnTap(
        borderRadius: 25.sp,
        contentPadding: widget.contentPadding,

        validateText: widget.validationText ?? "Date Required",

        // isValid: false,

        readOnly: true,
        onTap: () async {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.black12,
          ));
          var newDate = await datePicker(context);

          if (newDate != null) {
            setState(() {
              //  date = newDate;
              // widget.dateTime(newDate);
              widget.controller.text = newDate.humanReadableDate;
            });
          }
        },
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        isShadowRequired: widget.isShadowRequired,
        suffixHeight: widget.sHeight,
        suffixWidth: widget.sWidth,
        isValid: false,
        controller: widget.controller,
        isBorderRequired: widget.isBorderRequired,
        hintText: widget.hintText ?? "",
        validator: widget.validator,
        textInputType: TextInputType.text);
  }

  // String getHumanReadableDateAndTime(String dt) {
  //   DateTime dateTime = DateTime.parse(dt);
  //   return intl.DateFormat('yyyy/MM/dd').format(dateTime);
  // }
  // getHumanReadableDateAndTime(DateTime dateTime) {
  //   return intil.DateFormat('yyyy-MM-dd').format(dateTime);
  // }

  Future<DateTime?> datePicker(
    BuildContext context,
  ) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    ).whenComplete(() {
      setState(() {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ));
      });
    });

    if (newDate == null) {
      return null;
    } else {
      return newDate;
    }
  }
}
