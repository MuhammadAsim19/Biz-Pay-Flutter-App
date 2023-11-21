import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_popup_menu.dart';

class BussinesList extends StatelessWidget {
  final List<BusinessProductModel> businessProducts;
  final void Function(BusinessProductModel val) getData;
  final int? index;

  const BussinesList(
      {super.key,
      required this.businessProducts,
      required this.getData,
      this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: GestureDetector(
        onTap: () {},
        child: Container(
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
              AssetImageWidget(
                url: businessProducts[index!].businessImage!,
                width: 119.sp,
                height: 120.h,
              ),
              10.x,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText(businessProducts[index!].location!,
                            style: Styles.circularStdRegular(context,
                                color: AppColors.lightGreyColor)),
                        const Spacer(),
                        const CustomPopupMenu(),
                      ],
                    ),
                    5.y,
                    Align(
                        child: AppText(
                      businessProducts[index!].businessName!,
                      style:
                          Styles.circularStdRegular(context, fontSize: 17.sp),
                      maxLine: 3,
                    )),
                    5.y,
                    Row(
                      children: [
                        AppText(businessProducts[index!].price!,
                            style: Styles.circularStdBold(context)),
                        const Spacer(),
                        SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: SvgPicture.asset(Assets.show),
                        ),
                        5.x,
                        AppText(AppStrings.viewTwentyfive,
                            style: Styles.circularStdMedium(context,
                                fontSize: 12.sp)),
                        5.x,
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
