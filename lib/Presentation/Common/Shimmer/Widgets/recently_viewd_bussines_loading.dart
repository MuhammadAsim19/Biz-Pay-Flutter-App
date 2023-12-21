import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/app_shimmer.dart';

class RecentViewedBusinessLoading extends StatelessWidget {
  const RecentViewedBusinessLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 1.sw / 1.27,
              height: 1.sh,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppShimmer(
                    child: Container(
                      height: 120.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  10.x,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppShimmer(
                          child: Container(
                            height: 10.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                          ),
                        ),
                        15.y,
                        AppShimmer(
                          child: Container(
                            height: 10.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                          ),
                        ),
                        5.y,
                        AppShimmer(
                          child: Container(
                            height: 10.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                          ),
                        ),
                        15.y,
                        AppShimmer(
                          child: Container(
                            height: 12.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return 5.x;
          },
          itemCount: 5),
    );
  }
}
