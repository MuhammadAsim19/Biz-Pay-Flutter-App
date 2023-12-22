import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/app_shimmer.dart';

class SavedLoading extends StatelessWidget {
  const SavedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              width: 1.sw / 1.27,
              height: 100.h,
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
                        10.y,
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
                        10.y,
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
                      ],
                    ),
                  ),
                  10.x,
                  AppShimmer(
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return 15.y;
          },
          itemCount: 3),
    );
  }
}
