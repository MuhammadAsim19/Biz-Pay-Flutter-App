import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Components/chart_revenue.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

   body: NestedScrollView(
       physics: const BouncingScrollPhysics(),
       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
         print(innerBoxIsScrolled);

       return [
         SliverAppBar(
           elevation: 0,
           stretch: true,
           pinned: true,
           automaticallyImplyLeading: false,
           flexibleSpace:  SingleChildScrollView(
             child: Column(

               children: [
//10.y,
                 Container(
                   height: 300.sp,

decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.dummyImage4),fit: BoxFit.fill)),
child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

  GestureDetector(

      onTap: (){
        Navigate.pop(context);
      },
      child:   Container(
        margin: const EdgeInsets.only(left: 10),
        child:   SvgPicture.asset(Assets.arrowBackIcon,width: 20.sp,height:
        35.sp,
          fit: BoxFit.fitWidth
          ,

        ),
      ),
  ),
    const Spacer(),
const Icon(Icons.share),
    3.x,
    SvgPicture.asset(Assets.heartLight),
    10.x

],),

                 )

               ],

             ),
           ),
           backgroundColor: AppColors.whiteColor,
           expandedHeight: MediaQuery
               .of(context)
               .size
               .height * 0.36,
         ),
       ];
   }, body: Padding(
     padding: const EdgeInsets.symmetric(horizontal: 24),
     child: SingleChildScrollView(

       physics: const BouncingScrollPhysics(),
       child: Column
           (
         crossAxisAlignment: CrossAxisAlignment.start
         ,
           children: [
             10.y,
             Row(children: [
               //24.x,
               AppText('San Francisco, USA', style: Styles.circularStdRegular(context,color: AppColors.lightGreyColor,fontSize: 12)),

const Spacer(),
               const Icon(Icons.remove_red_eye_outlined,size: 19,),
               AppText('View', style: Styles.circularStdRegular(context,color: AppColors.lightGreyColor,fontSize: 12)),
               5.x,
               AppText('321', style: Styles.circularStdRegular(context,color: AppColors.lightGreyColor,fontSize: 12)),
10.x


             ],),
             5.y,
             AppText("Drop shipping website & E-commerce business", style: Styles.circularStdMedium(context,fontSize: 22),maxLine: 3,overflow: TextOverflow.ellipsis,),
10.y,
             AppText("\$40k USD", style: Styles.circularStdMedium(context,fontSize: 16.sp,color: AppColors.primaryColor))
,
          10.y,
             AppText("Are you looking to start your own e-commerce venture without the hassle of managing inventory? Consider buying a drop shipping website and e-commerce business. With this turnkey solution, you can leverage existing supplier relationships and a ready-made online storefront to jumpstart your online sales. It's an efficient way to enter the world of e-commerce and start selling products to a global audience.", style: Styles.circularStdRegular(
                 context,fontSize: 12,color: AppColors.lightGreyColor),maxLine: 8,overflow: TextOverflow.ellipsis,),
15.y,

             Row(

               children: [
                 AppText("Industry", style: Styles.circularStdRegular(context,fontSize: 16.sp)),
                 const Spacer(),
                 AppText("Amazon Drop Shipping", style: Styles.circularStdRegular(context,fontSize: 16.sp)),




               ],

             ),
             5.y,
             Row(
mainAxisAlignment:
               MainAxisAlignment.start,

               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 AppText("Year found", style: Styles.circularStdRegular(context,fontSize: 16.sp)),
                 const Spacer(),
                 AppText("2009", style: Styles.circularStdRegular(context,fontSize: 16.sp)),
const Spacer()



               ],

             ),
             5.y,
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,

               children: [
                 AppText("# of owner", style: Styles.circularStdRegular(context,fontSize: 16.sp)),
                 const Spacer(),
                 AppText("2", style: Styles.circularStdRegular(context,fontSize: 16.sp)),

 const Spacer()


               ],

             ),
             5.y,
             Row(
mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 AppText("# of employees", style: Styles.circularStdRegular(context,fontSize: 16.sp)),
                 const Spacer(),
                 AppText("19", style: Styles.circularStdRegular(context,fontSize: 16.sp)),
const Spacer()



               ],

             ),
             10.y,
             
             AppText('Business hour', style: Styles.circularStdMedium(context,fontSize: 20)),

             ChipWidget(labelText: "20hr per week",height:60.sp,style: Styles.circularStdRegular(context,color: AppColors.whiteColor),)
,10.y,
             AppText('Advantages', style: Styles.circularStdMedium(context,fontSize: 20)),

             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               physics:const BouncingScrollPhysics(),
               child: Row(
                 children: [
                   ChipWidget(labelText: "Building property",height:60.sp,style: Styles.circularStdRegular(context,color: AppColors.whiteColor),),
5.x,
                   ChipWidget(labelText: "Equipment",height:60.sp,style: Styles.circularStdRegular(context,color: AppColors.whiteColor),),
                   5.x,
                   ChipWidget(labelText: "Contracts",height:60.sp,style: Styles.circularStdRegular(context,color: AppColors.whiteColor),),
                   5.x,
                   ChipWidget(labelText: "Access",height:60.sp,style: Styles.circularStdRegular(context,color: AppColors.whiteColor),),
                   5.x,
                   ChipWidget(labelText: "Availability",height:60.sp,style: Styles.circularStdRegular(context,color: AppColors.whiteColor),),
                   5.x

                 ],
               ),
             )
,
             10.y,
             AppText('Documents', style: Styles.circularStdMedium(context,fontSize: 20)),

              Row(
               children: [
SvgPicture.asset(Assets.pdfIcon),
                 10.x,
                 Column(
                   crossAxisAlignment:
                   CrossAxisAlignment.start,
                   children: [
                     AppText("business portfolio.pdf", style: Styles.circularStdMedium(context,fontSize: 16.sp)),
                   AppText("656 kb", style: Styles.circularStdRegular(context,color: AppColors.lightGreyColor))
                   
                   ],
                 ),
                 
                 const Spacer(),
                 
                 SvgPicture.asset(Assets.downloadIcon)
                 

               ],
             ),
             14.y,
             AppText('Revenue history', style: Styles.circularStdMedium(context,fontSize: 20)),

             FractionallySizedBox(
               widthFactor: 1.07,
               child: VerticalBarChart(),
             ),

           ],

       ),
     ),
   ),),

      ),
    );
  }
}
