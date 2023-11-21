import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';

class BusinessForYouWidget extends StatelessWidget {

  final List<BusinessProductModel>  businessProducts;
  final void Function(BusinessProductModel val) getData;
  // final void Function(BusinessProductModel val) chatTap;
  final void Function(BusinessProductModel val) chatTap;
  const BusinessForYouWidget({super.key, required this.businessProducts, required this.getData, required this.chatTap});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(

      height: 280.h,
      child: ListView.separated(
          shrinkWrap: true,

          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){

            return GestureDetector(
              onTap: ()
              {
                getData(businessProducts[index]);
              },
              child: Container(
                width: 245.w,
                // height: 100.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFEEF1F6)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Stack(
                      children: [
                        AssetImageWidget(url: businessProducts[index].businessImage!,width: 245.w,height: 170.h,),
                        Positioned(
                          // bottom: 0,
                          // left: 0,
                            top: 10,
                            right: 10,

                            child: SvgPicture.asset(businessProducts[index].isFav==false?Assets.heartWhiteLight:Assets.heartRed))

                      ],
                    )
                    ,
                    //  10.x,
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 10.sp
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            10.y,
                            AppText(businessProducts[index].location!, style: Styles.circularStdRegular(context,color: AppColors.lightGreyColor)),
                            5.y,
                            AppText(businessProducts[index].businessName!, style: Styles.circularStdRegular(context,fontSize: 14,fontWeight: FontWeight.w500
                            ),maxLine: 3,),

                            7.y,
                            Row(
                              children: [
                                AppText(businessProducts[index].price!, style: Styles.circularStdBold(context)),
                                const Spacer(),
                                ///chat  chip
                                GestureDetector(
                                  onTap: ()
                                  {

                                    chatTap(businessProducts[index]);

                                  },
                                  child: const ChipWidget(),
                                ),
                                // CustomButton(onTap: onTap, text: text)
                                5.x
                                // CustomButton(onTap: (){}, text: 'Chat',height: 37,width: 70,textSize: 14,borderRadius: 30,)
                              ],
                            ),



                          ],),
                      ),
                    )
                  ],

                ),

              ),
            );

          }, separatorBuilder:(context,index)
      {
        return 5.x;

      }, itemCount: businessProducts.length),
    );
  }
}


