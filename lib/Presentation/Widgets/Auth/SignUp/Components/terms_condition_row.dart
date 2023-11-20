import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class TermsAndConditionTextRow extends StatefulWidget {
  const TermsAndConditionTextRow({super.key});

  @override
  State<TermsAndConditionTextRow> createState() =>
      _TermsAndConditionTextRowState();
}

class _TermsAndConditionTextRowState extends State<TermsAndConditionTextRow> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
          child: Checkbox(
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = value!;
              });
            },
          ),
        ),
        RichText(
            text: TextSpan(
                text: 'By signing up, to our',
                style: Styles.circularStdRegular(context,
                    color: AppColors.greyLightColor, fontSize: 16.sp),
                children: [
              TextSpan(
                text: ' Term of\nService',
                style: Styles.circularStdRegular(context,
                    color: AppColors.blackColor, fontSize: 16.sp),
              ),
              TextSpan(
                text: ' and',
                style: Styles.circularStdMedium(context,
                    color: AppColors.greyLightColor, fontSize: 16.sp),
              ),
              TextSpan(
                text: ' Privacy Policy',
                style: Styles.circularStdRegular(context, fontSize: 16.sp),
              )
            ]))
      ],
    );
  }
}
