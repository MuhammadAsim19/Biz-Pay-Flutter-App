import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/app_shimmer.dart';

class BrokerLoading extends StatelessWidget {
  const BrokerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180.h,
        width: 1.sw,
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return 20.x;
            },
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppShimmer(
                    child: Container(
                      width: 80.w,
                      height: 100.h,
                      decoration: const BoxDecoration(
                        color: AppColors.greyTextColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  5.y,
                  AppShimmer(
                    child: Container(
                      width: 70.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                  15.y,
                  AppShimmer(
                    child: Container(
                      width: 70.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                  30.y,
                  SizedBox(
                    height: 20.sp,
                    width: 1.sw / 3,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return 10.x;
                      },
                      padding: EdgeInsets.only(left: 10.sp),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return AppShimmer(
                          child: Container(
                            width: 60.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              color: AppColors.greyColor,
                            ),
                          ),
                        );
                      },
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
