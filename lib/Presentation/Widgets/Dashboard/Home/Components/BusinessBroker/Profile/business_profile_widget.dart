import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisness_profile.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Common/custom_rating_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BusinessProfileWidget extends StatelessWidget {
  final List<BusinessBrokerProfile> profileData;

  final void Function(BusinessBrokerProfile val) getData;
  const BusinessProfileWidget({super.key, required this.profileData, required this.getData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        itemBuilder: (context,index){

      return Container(
        width: 181.w,
        height: 257.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEEF1F6)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(

          children: [
            5.y,
            AssetImageWidget(url: profileData[index].image.toString(),height: 120.sp,width: 120.sp,),
15.y,
AppText('Business Broker', style: Styles.circularStdRegular(context,color: AppColors.lightGreyColor,fontSize: 12.sp)),
          5.y,
            AppText( profileData[index].name.toString(), style: Styles.circularStdMedium(context,fontSize: 18.sp)),
          10.y,
            RatingBar(
              ignoreGestures: true,
              initialRating: profileData[index].rating!.toDouble(),
              itemSize: 20,
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                half: const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                empty: const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
              ),
              onRatingUpdate: (value) {},
              tapOnlyMode: true,
              updateOnDrag: false,
            ),
15.y,
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  physics: const NeverScrollableScrollPhysics(),
  child:   Row(children: [
//5.x,
    for(int i =0;i<profileData[index].businessCategories!.length;i++)

      i >1?
      AppText("+${profileData[index].businessCategories!.length-2} more", style: Styles.circularStdRegular(context,fontSize: 12,color: AppColors.blackColor
      ))

          :
      Align(child: ChipWidget(labelText:profileData[index].businessCategories![i] ,height: 30,style: Styles.circularStdRegular(context,fontSize: 10.sp,color: AppColors.whiteColor),)),
3.x,


  ],),
)
          ],

        ),

      );
    }, separatorBuilder: (context,index){

      return 5.x;

    }, itemCount: profileData.length);
  }
}