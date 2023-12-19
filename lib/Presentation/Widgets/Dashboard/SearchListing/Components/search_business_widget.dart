import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';

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
    return ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              getData(businessProducts![index]);
            },
            child: Container(
              // width: 245.w,
              height: 300.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFEEF1F6)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          AssetImageWidget(
                              url: businessProducts![index].images!.first,
                              width: 380,
                              height: 193.h),
                          // Positioned(
                          //   // bottom: 0,
                          //   // left: 0,
                          //     top: 10,
                          //     right: 10,
                          //
                          //     child: SvgPicture.asset(businessProducts[index].isFav==false?Assets.heartWhiteLight:Assets.heartRed))
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
                              5.y,
                              Row(
                                children: [
                                  AppText(businessProducts![index].address!,
                                      style: Styles.circularStdRegular(context,
                                          color: AppColors.lightGreyColor,
                                          fontSize: 12)),
                                  const Spacer(),
                                  AppText(
                                      "\$${businessProducts![index].salePrice!}",
                                      style: Styles.circularStdBold(context,
                                          fontSize: 18)),
                                ],
                              ),
                              5.y,
                              Stack(
                                children: [
                                  AppText(
                                    businessProducts![index].name!,
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 20),
                                    maxLine: 3,
                                    overflow: TextOverflow.ellipsis,
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
                  Positioned(
                    bottom: 30,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        chatTap(businessProducts![index]);
                      },
                      child: const ChipWidget(),
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
        itemCount: businessProducts!.length);
  }
}
