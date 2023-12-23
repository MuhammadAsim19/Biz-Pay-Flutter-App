import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_and_terms_model.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_model.dart';

class PrivacyPolicyTile extends StatelessWidget {
  const PrivacyPolicyTile(
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
  final PrivacyPolicyModel? data;
  final TextAlign? textAlign;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    log("jjjuuuuuu${data!}");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText("data!.title!,",
              style: Styles.circularStdBold(context, fontSize: 14.sp)),
          AppText(data!.title!,
              style: Styles.circularStdBold(context, fontSize: 14.sp)),
          // data?.description != null
          //     ? AppText(data?.description ?? "",
          //         maxLine: 5,
          //         style: Styles.circularStdRegular(context, fontSize: 14.sp))
          //     : 6.y,
          // if (data?.points != null)
          //   for (int i = 0; i < data!.points!.list!.length; i++)
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         data!.points!.list![i].title!.isNotEmpty
          //             ? AppText(data!.points!.list![i].title ?? "",
          //                 style: Styles.circularStdBold(context))
          //             : 0.y,
          //         AppText(data!.points!.list![i].desc ?? "",
          //             maxLine: 5,
          //             style:
          //                 Styles.circularStdRegular(context, fontSize: 14.sp)),
          //         6.y,
          //       ],
          //     )

          // // if (data?.title != null)
          // //   Padding(
          // //     padding: const EdgeInsets.only(
          // //       left: 8.0,
          // //       right: 8.0,
          // //       bottom: 8.0,
          // //     ),
          // //     child: AppText(
          // //       "${data?.title}",
          // //       textAlign: TextAlign.left,
          // //       style: Styles.circularStdMedium(context),
          // //     ),
          // //   ),
          // // if (data?.description != null)
          // //   Padding(
          // //     padding: EdgeInsets.only(
          // //         left: left ?? 15.0, right: right ?? 10.0, bottom: 1.0),
          // //     child: AppText("${data?.description}",
          // //         maxLine: 10,
          // //         textAlign: TextAlign.justify,
          // //         style: Styles.circularStdRegular(
          // //           context,
          // //         )),
          // //   ),
          // // if (data?.points != null)
          // //   Column(
          // //     crossAxisAlignment: CrossAxisAlignment.start,
          // //     children: [
          // //       if (data?.points?.title != null)
          // //         Padding(
          // //           padding: const EdgeInsets.symmetric(
          // //               vertical: 8.0, horizontal: 12),
          // //           child: AppText(
          // //             data!.points!.title!,
          // //             style:
          // //                 Styles.circularStdRegular(context, fontSize: 15.sp),
          // //             maxLine: 5,
          // //           ),
          // //         ),
          // //       if (data!.points!.list!.isNotEmpty)
          // //         for (ListElement point in data!.points!.list!)
          // //           Padding(
          // //             padding: const EdgeInsets.symmetric(
          // //                 vertical: 4.0, horizontal: 12),
          // //             child: AppText(
          // //               "${point.icon}   ${point.title}",
          // //               style:
          // //                   Styles.circularStdRegular(context, fontSize: 16.sp),
          // //             ),
          // //           )
          // //     ],
          // //   ),
        ],
      ),
    );
  }
}
