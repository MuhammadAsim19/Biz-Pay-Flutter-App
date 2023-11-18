import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';

class SavedListBusiness extends StatelessWidget {
  final List<BusinessProductModel>  businessProducts;
  final void Function(BusinessProductModel val) getData;
  const SavedListBusiness({super.key, required this.businessProducts, required this.getData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      //height: 110.h,
      child: ListView.separated(
          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical
          ,
          itemBuilder: (context,index){

            return GestureDetector(
              onTap: ()
              {
                getData(businessProducts[index]);
              },
              child: Stack(
                children: [
                  Container(
                   // width: 338.sp,
                    height: 120.h,
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

                        AssetImageWidget(url: businessProducts[index].businessImage!,width: 119.sp,height: 120.h,)
                        ,
                        10.x,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              AppText(businessProducts[index].location!, style: Styles.circularStdRegular(context,color: AppColors.lightGreyColor)),
                              10.y,
                              Align(child: AppText(businessProducts[index].businessName!, style: Styles.circularStdRegular(context,fontSize: 14),maxLine: 3,)),

                              10.y,
                              AppText(businessProducts[index].price!, style: Styles.circularStdBold(context)),



                            ],),
                        )
                      ],

                    ),

                  ),
                  Positioned(
                    // bottom: 0,
                    // left: 0,
                      top: 5,
                      right: 10,

                      child: SvgPicture.asset(businessProducts[index].isFav==false?Assets.heartLight:Assets.heartRed))
                ],
              ),
            );

          }, separatorBuilder:(context,index)
      {
        return 15.y;

      }, itemCount: businessProducts.length),
    );
  }
}
