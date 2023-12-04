import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';

class RecentlyViewWidget extends StatelessWidget {
  final List<BusinessProductModel> businessProducts;
  final void Function(BusinessProductModel val) getData;

  const RecentlyViewWidget(
      {super.key, required this.businessProducts, required this.getData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                getData(businessProducts[index]);
              },
              child: Container(
                width: 1.sw / 1.27,
                height: 100.h,
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
                      url: businessProducts[index].businessImage!,
                      width: 119.sp,
                      height: 120.h,
                    ),
                    10.x,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(businessProducts[index].location!,
                              style: Styles.circularStdRegular(context,
                                  color: AppColors.lightGreyColor,
                                  fontSize: 14)),
                          1.y,
                          Align(
                              child: AppText(
                            businessProducts[index].businessName!,
                            style: Styles.circularStdRegular(context,
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                            maxLine: 3,
                          )),
                          5.y,
                          AppText(businessProducts[index].price!,
                              style: Styles.circularStdBold(context)),
                        ],
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
          itemCount: businessProducts.length),
    );
  }
}
