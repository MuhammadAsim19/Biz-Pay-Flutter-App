import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';

class RecentlyAdded extends StatelessWidget {
  final List<BusinessModel>? businessProducts;
  final void Function(BusinessModel val) getData;
  final void Function(BusinessModel val) chatTap;

  const RecentlyAdded(
      {super.key,
      required this.businessProducts,
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
                              isCircle: false,
                              topRadius: 10.sp,
                              url: businessProducts![index].images!.isNotEmpty
                                  ? "${ApiConstant.baseUrl}${businessProducts![index].images!.first}"
                                  : "",
                              width: 245.w,
                              height: 170.h,
                            ),
                          ],
                        ),
                        5.y,
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.y,
                                AppText(businessProducts![index].address!,
                                    style: Styles.circularStdRegular(context,
                                        color: AppColors.lightGreyColor,
                                        fontSize: 14.sp)),
                                5.y,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppText(
                                    businessProducts![index].name!,
                                    style: Styles.circularStdRegular(context,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                    maxLine: 3,
                                  ),
                                ),
                                Row(
                                  children: [
                                    AppText(
                                        "\$ ${businessProducts![index].salePrice!}",
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
                                    8.x
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
