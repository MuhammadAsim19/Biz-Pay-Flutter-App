import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/ViewAllBusiness/view_all_business.dart';

class BusinessForYouWidget extends StatelessWidget {
  final List<BusinessModel>? businessProducts;
  final void Function(BusinessModel val) getData;

  // final void Function(BusinessProductModel val) chatTap;
  final void Function(BusinessModel val) chatTap;

  const BusinessForYouWidget(
      {super.key,
      this.businessProducts,
      required this.getData,
      required this.chatTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: businessProducts!.isNotEmpty
          ? ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                print("${businessProducts![index].id}");
                return GestureDetector(
                  onTap: () {
                    getData(businessProducts![index]);
                  },
                  child: Container(
                    width: 245.w,
                    // height: 100.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFEEF1F6)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CachedImage(
                              topRadius: 10.sp,
                              isCircle: false,
                              url: businessProducts![index].images!.isNotEmpty
                                  ? "${ApiConstant.baseUrl}${businessProducts![index].images!.first}"
                                  : '',
                              width: 245.w,
                              height: 170.h,
                            ),
                            // Positioned(
                            //     // bottom: 0,
                            //     // left: 0,
                            //     top: 10,
                            //     right: 10,
                            //     child: SvgPicture.asset(
                            //         businessProducts[index].isFav == false
                            //             ? Assets.heartWhiteLight
                            //             : Assets.heartRed))
                          ],
                        ),
                        //  10.x,
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.y,
                                AppText(businessProducts![index].address!,
                                    style: Styles.circularStdRegular(context,
                                        color: AppColors.lightGreyColor,
                                        fontSize: 14.sp)),
                                5.y,
                                AppText(
                                  businessProducts![index].name!,
                                  style: Styles.circularStdRegular(context,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  maxLine: 3,
                                ),
                                4.y,
                                Row(
                                  children: [
                                    AppText(
                                        "\$${businessProducts![index].salePrice.toString()}",
                                        style: Styles.circularStdBold(context)),
                                    const Spacer(),

                                    ///chat  chip
                                    GestureDetector(
                                      onTap: () {
                                        chatTap(businessProducts![index]);
                                      },
                                      child: const ChipWidget(),
                                    ),
                                    // CustomButton(onTap: onTap, text: text)
                                    5.x
                                    // CustomButton(onTap: (){}, text: 'Chat',height: 37,width: 70,textSize: 14,borderRadius: 30,)
                                  ],
                                ),
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
                return 5.x;
              },
              itemCount: businessProducts!.length)
          : Center(
              child: AppText(
                'Data not found',
                style: Styles.circularStdRegular(context),
              ),
            ),
    );
  }
}
