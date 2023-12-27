import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_and_terms_model.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_model.dart';

class TermsAndPrivacyTextTile extends StatelessWidget {
  const TermsAndPrivacyTextTile(
      {this.right,
      this.left,
      this.heading,
      this.sized = 18,
      this.data,
      this.textAlign,
      super.key,
      this.subheading});

  final String? heading;
  final String? subheading;
  final double? sized;
  final PrivacyAndTermsModel? data;

  final TextAlign? textAlign;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            data?.title ?? "",
            style: Styles.circularStdBold(context, fontSize: 14.sp),
          ),
          data?.description != null
              ? AppText(
                  data?.description ?? "",
                  maxLine: 5,
                  style: Styles.circularStdRegular(context, fontSize: 14.sp),
                )
              : const SizedBox(height: 6),
          if (data?.points != null)
            for (int i = 0; i < data!.points!.list!.length; i++)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data!.points!.list![i].title ?? "",
                    style: Styles.circularStdBold(context),
                  ),
                  AppText(
                    data!.points!.list![i].desc ?? "",
                    maxLine: 5,
                    style: Styles.circularStdRegular(context, fontSize: 14.sp),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
        ],
      ),
    );
  }
}
