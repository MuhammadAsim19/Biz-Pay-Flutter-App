import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Data/DataSource/Resources/utils.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/change_password.dart';

class YourBusiness extends StatelessWidget {
  List<String> images = [
    Assets.businessimage1,
    Assets.businessimage2,
    Assets.businessimage3
  ];

  YourBusiness({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.listYourbis,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              40.y,
              Column(
                children: [
                  Container(
                    height: 600.h,
                    width: 500.h,
                    child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        final product = images[index];
                        return Container(
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 107, 99, 99),
                                width: 0.5.w),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r)),
                                child: AssetImageWidget(
                                    height: 120.h,
                                    width: 100.w,
                                    url: images[index]),
                              ),
                              5.x,
                              5.y,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        AppText(
                                          AppStrings.sanfancisco,
                                          style: Styles.circularStdRegular(
                                              context,
                                              fontSize: 12.sp,
                                              color: AppColors.greyMedium),
                                        ),
                                        75.x,
                                        Stack(
                                          children: [
                                            Positioned(
                                                child: SvgPicture.asset(
                                                    Assets.dropdown))
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Stack(),
                                    Text(
                                      Utils.Dropshipping,
                                      style: Styles.circularStdRegular(context,
                                          fontSize: 18.sp,
                                          color: AppColors.blackColor),
                                    ),
                                    15.y,
                                    Row(
                                      children: [
                                        Text(
                                          AppStrings.fourtyK,
                                          style: Styles.circularStdBold(context,
                                              fontSize: 16.sp,
                                              color: AppColors.blackColor),
                                        ),
                                        40.x,
                                        SvgPicture.asset(Assets.show),
                                        5.x,
                                        AppText(AppStrings.viewTwentyfive,
                                            style: Styles.circularStdRegular(
                                              context,
                                              fontSize: 12.sp,
                                            ))
                                      ],
                                    ),
                                    // SvgPicture.asset(Assets.arrowleft)
                                    // Text(product.description, style: TextStyle(fontSize: 16.0)),
                                    // Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              50.y,
            ],
          ),
        ),
      ),
    );
  }
}
