import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/business_shimmer.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Category/Controller/category_business_cubit.dart';

class SearchBusinessWidget extends StatelessWidget {
  final List<BusinessModel>? businessProducts;
  final void Function(BusinessModel val) getData;
  final void Function(BusinessModel val) chatTap;

  const SearchBusinessWidget(
      {super.key,
      required this.businessProducts,
      required this.getData,
      required this.chatTap});

  @override
  Widget build(BuildContext context) {
    return businessProducts!.isNotEmpty
        ? SizedBox(
            height: 0.75.sh,
            width: 1.sw,
            child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      getData(businessProducts![index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15.sp)),
                      height: 280.sp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedImage(
                              isCircle: false,
                              url:
                                  "${ApiConstant.baseurl}${businessProducts![index].images!.first}",
                              width: 380,
                              height: 153.h),
                          //  10.x,
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  5.y,
                                  Row(
                                    children: [
                                      AppText(businessProducts![index].address!,
                                          style: Styles.circularStdRegular(
                                              context,
                                              color: AppColors.lightGreyColor,
                                              fontSize: 12)),
                                      const Spacer(),
                                      AppText(
                                          "\$${businessProducts![index].salePrice!}",
                                          style: Styles.circularStdBold(context,
                                              fontSize: 18)),
                                      5.x,
                                    ],
                                  ),
                                  5.y,
                                  AppText(
                                    businessProducts![index].name!,
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 20),
                                    maxLine: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  5.y,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          chatTap(businessProducts![index]);
                                        },
                                        child: const ChipWidget(),
                                      ),
                                    ],
                                  ),

                                  //  7.y,
                                  // Row(
                                  //   children: [
                                  //     const Spacer(),
                                  //     ///chat  chip
                                  //
                                  //     // CustomButton(onTap: onTap, text: text)
                                  //     5.x
                                  //     // CustomButton(onTap: (){}, text: 'Chat',height: 37,width: 70,textSize: 14,borderRadius: 30,)
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return 10.y;
                },
                itemCount: businessProducts!.length),
          )
        : Center(
            child: AppText('Data Not found',
                style: Styles.circularStdRegular(context)),
          );
  }
}
