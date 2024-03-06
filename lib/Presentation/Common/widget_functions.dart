import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:flutter/cupertino.dart';

class WidgetFunctions {
  WidgetFunctions._private();

  static final instance = WidgetFunctions._private();

  showErrorSnackBar({String? error, required BuildContext context}) {
    WidgetFunctions.instance.snackBar(context,
        text: error,
        bgColor: AppColors.primaryColor,
        textStyle:
            Styles.circularStdRegular(context, color: AppColors.whiteColor));
  }

  Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>> snackBar(
      BuildContext context,
      {String? text,
      Color? bgColor,
      TextStyle? textStyle}) async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text ?? "",
        style: textStyle ??
            Styles.circularStdMedium(context, color: AppColors.whiteColor),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      duration: const Duration(seconds: 2),
      backgroundColor: bgColor ?? AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      shape: Theme.of(context).snackBarTheme.shape,
    ));
  }

  Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>> toast(
      BuildContext context, SnackBar snackBar) async {
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  button(
    BuildContext context, {
    required Widget child,
    double hPadding = 20,
    double vPadding = 2,
    required void Function()? onPressed,
    Color? color,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        child: CupertinoButton(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          onPressed: onPressed,
          color: color ?? Theme.of(context).buttonTheme.colorScheme!.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
            ],
          ),
        ),
      );

  dropDown(
    BuildContext context, {
    required List? values,
    required List? titles,
    String heading = "title",
    String placeholder = 'select',
    double? paddingVert = 25,
    double? width,
    dynamic selectedValue,
    void Function(Object?)? onChange,
  }) {
    // simple usage
    if (values!.length != titles!.length) {
      throw "The length of values and titles must be same";
    }
    return Container(
      width: width ?? 150,
      //height: 50,
      padding: EdgeInsets.only(left: 15.sp, right: 10.sp),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF1F6),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFEEF1F6)),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: DropdownButtonFormField(
          // itemHeight: 100,
          //menuMaxHeight: 100,
          isExpanded: true,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          value: selectedValue,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          hint: AppText(
            placeholder,
            style: Styles.circularStdRegular(context,
                color: const Color(0xFFB0B0B0)),
            overflow: TextOverflow.ellipsis,
          ),
          items: [
            for (var i = 0; i < titles.length; i++)
              DropdownMenuItem(
                value: values[i],
                child: AppText(
                  titles[i],
                  style: Styles.circularStdRegular(context),
                ),
              ),
          ],
          onChanged: onChange),
    );
  }

  menu(
      {required List<PopupMenuEntry> items,
      void Function(dynamic)? onSelected,
      IconData? icon,
      double? iconSize,
      Color? iconColor}) {
    return PopupMenuButton(
        iconSize: iconSize ?? 18,
        icon: Icon(
          icon ?? Icons.more_vert,
          color: iconColor ?? Colors.black87,
        ),
        padding: const EdgeInsets.all(4),
        color: Colors.white,
        elevation: 20,
        enabled: true,
        onSelected: onSelected,
        itemBuilder: (context) => items);
  }

  dialog(BuildContext context,
      {required Widget child,
      double radius = 12,
      double elevation = 4,
      Color? bgColor,
      bool clickOutSideClose = true,
      AlignmentGeometry? alignment,
      EdgeInsets? insetsPadding,
      Curve curve = Curves.decelerate,

      /// [insetAnimationDuration] count unit is Milli Seconds
      int insetAnimationDuration = 100}) {
    Dialog _dialog = Dialog(
      backgroundColor: bgColor ?? Theme.of(context).cardColor,
      elevation: elevation,
      alignment: alignment,
      insetPadding: insetsPadding,
      insetAnimationCurve: curve,
      insetAnimationDuration: Duration(milliseconds: insetAnimationDuration),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      //this right here
      child: child,
    );
    showDialog(
        context: context,
        barrierDismissible: clickOutSideClose,
        builder: (BuildContext context) => _dialog);
  }
}
