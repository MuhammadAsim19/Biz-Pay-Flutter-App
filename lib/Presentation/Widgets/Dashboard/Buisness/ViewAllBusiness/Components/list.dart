import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_popup_menu.dart';

class BusinessListContainer extends StatelessWidget {
  final List<BusinessModel>? businessProducts;
  final void Function(BusinessModel val) getData;
  final int? index;
  final bool isFromAllBusiness;

  const BusinessListContainer(
      {super.key,
      required this.businessProducts,
      required this.getData,
      required this.isFromAllBusiness,
      this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getData(businessProducts![index!]);
      },
      child: Container(
        height: 120.sp,
        width: 338.sp,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEEF1F6)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (businessProducts![index!].images != null)
              CachedImage(
                radius: 30.sp,
                containerRadius: 10.sp,
                isCircle: false,
                url:
                    "${ApiConstant.baseurl}/${businessProducts![index!].images!.first}",
                width: 119.sp,
                height: 120.h,
              ),
            10.x,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.y,
                  Row(
                    children: [
                      Expanded(
                        child: AppText(businessProducts![index!].address!,
                            maxLine: 1,
                            style: Styles.circularStdRegular(context,
                                color: AppColors.lightGreyColor)),
                      ),
                    ],
                  ),
                  5.y,
                  AppText(
                    businessProducts![index!].name!,
                    style: Styles.circularStdRegular(context, fontSize: 17.sp),
                    maxLine: 1,
                  ),
                  5.y,
                  AppText("\$ ${businessProducts![index!].salePrice!}",
                      style: Styles.circularStdBold(context)),
                  3.y,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: SvgPicture.asset(Assets.show),
                        ),
                        5.x,
                        AppText(businessProducts![index!].viewsCount.toString(),
                            style: Styles.circularStdMedium(context,
                                fontSize: 12.sp)),
                        10.x,
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
