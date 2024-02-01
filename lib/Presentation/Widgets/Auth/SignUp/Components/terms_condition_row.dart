import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Controllers/agree_to_privacy.dart';

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
          child: ValueListenableBuilder(
            valueListenable: AgreeToPrivacyAndTerms.agree,
            builder: (context, value, child) {
              return Checkbox(
                value: value,
                onChanged: (value) {
                  setState(() {
                    checked = value!;
                  });
                  AgreeToPrivacyAndTerms.agree.value = value!;
                },
              );
            },
          ),
        ),
        Flexible(
          child: RichText(
              text: TextSpan(
                  text: 'By signing up, you’re agree to our',
                  style: Styles.circularStdRegular(context,
                      color: AppColors.greyLightColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                  children: [
                TextSpan(
                  text: ' Term of Service',
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
              ])),
        )
      ],
    );
  }
}
