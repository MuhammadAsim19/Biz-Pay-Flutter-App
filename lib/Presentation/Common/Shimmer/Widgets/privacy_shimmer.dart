import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/app_shimmer.dart';
import 'package:buysellbiz/Presentation/Common/app_shadow.dart';

class PrivacyPolicyShimmer extends StatelessWidget {
  const PrivacyPolicyShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            separatorBuilder: (context, index) {
              return 10.y;
            },
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppShimmer(
                    child: Container(
                      width: 50.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  10.y,
                  AppShimmer(
                    child: Container(
                      width: 40.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.sp),
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),

                  // Positioned(
                  //   // bottom: 0,
                  //   // left: 0,
                  //     top: 10,
                  //     right: 10,
                  //     child: SvgPicture.asset(
                  //         businessProducts[index].isFav == false
                  //             ? Assets.heartWhiteLight
                  //             : Assets.heartRed))
                  // //  10.x,
                  // Container(
                  //   margin: EdgeInsets.only(left: 10.sp),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       10.y,
                  //       AppText(businessProducts[index].location!,
                  //           style: Styles.circularStdRegular(context,
                  //               color: AppColors.lightGreyColor,
                  //               fontSize: 14.sp)),
                  //       5.y,
                  //       AppText(
                  //         businessProducts[index].businessName!,
                  //         style: Styles.circularStdRegular(context,
                  //             fontSize: 16, fontWeight: FontWeight.w600),
                  //         maxLine: 3,
                  //       ),
                  //       4.y,
                  //       Row(
                  //         children: [
                  //           AppText(businessProducts[index].price!,
                  //               style: Styles.circularStdBold(context)),
                  //           const Spacer(),
                  //
                  //           ///chat  chip
                  //           GestureDetector(
                  //             onTap: () {
                  //               chatTap(businessProducts[index]);
                  //             },
                  //             child: const ChipWidget(),
                  //           ),
                  //           // CustomButton(onTap: onTap, text: text)
                  //           5.x
                  //           // CustomButton(onTap: (){}, text: 'Chat',height: 37,width: 70,textSize: 14,borderRadius: 30,)
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              );
            }));
  }
}
