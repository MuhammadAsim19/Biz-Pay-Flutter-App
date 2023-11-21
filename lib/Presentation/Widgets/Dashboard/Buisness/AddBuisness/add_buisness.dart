import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Components/business_details_add.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Components/price_location.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Components/publish.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';
class AddBusiness extends StatelessWidget {
  const AddBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async

      {
        print(AddNotifier.addBusinessNotifier.value);
        if(AddNotifier.addBusinessNotifier.value==0)
          {
           Navigate.pop(context);
          }
        else if(AddNotifier.addBusinessNotifier
        .value==1)
          {
            AddNotifier.addBusinessNotifier
                .value=0;
            AddNotifier.addPageController.jumpToPage(0);
          }
        else
          {
            AddNotifier.addBusinessNotifier
                .value=1;
            AddNotifier.addPageController.jumpToPage(1);
          }



        return  false;

      },
      child: Scaffold(


        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
          elevation: 1,
          title: AppText('Add New Business', style: Styles.circularStdMedium(context,fontSize: 18),),
          actions: [
            ValueListenableBuilder(
              builder: (context,state,ss) {
                return state==0? IconButton(
                  icon: const Icon(Icons.close,color: AppColors.blackColor,),
                  onPressed: () {
                    // Handle icon tap event

                    Navigate.pop(context);
                  },
                ):const SizedBox();
              }, valueListenable: AddNotifier.addBusinessNotifier,
            ),
          ],
        ),


body: Padding(
  padding:
  EdgeInsets.symmetric(horizontal: 24.sp),
  child:   Column(
      children: [
        10.y,

        ///top Three Containers
        ValueListenableBuilder(
          builder: (context,pageState,ss) {
            return Row(
              mainAxisSize: MainAxisSize.min,
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap:(){

                    AddNotifier.addPageController.jumpToPage(0);
                    AddNotifier.addBusinessNotifier.value=0;
                  },
                  child: Container(
                    width: 42.sp,
                    height: 42.sp,
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 34.w,
                        height: 34.h,
                        decoration: ShapeDecoration(
                          color:  Color(pageState==0?0xFF007BC0:0xFFD9D9D9),
                          shape: const CircleBorder(),
                        ),
                        child: Center(child: SvgPicture.asset(Assets.tickIcon)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1.sw/4,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){

                    AddNotifier.addPageController.jumpToPage(1);
                    AddNotifier.addBusinessNotifier.value=1;
                  },
                  child: Container(
                    width: 42.sp,
                    height: 42.sp,
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                    child:  Center(
                      child: Container(
                        width: 34.w,
                        height: 34.h,
                        decoration: ShapeDecoration(
                          color:  Color(pageState==1?0xFF007BC0:0xFFD9D9D9),
                          shape: const CircleBorder(),
                        ),
                        child: Center(child: SvgPicture.asset(Assets.tickIcon)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1.sw/4,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){

                    AddNotifier.addPageController.jumpToPage(2);
                    AddNotifier.addBusinessNotifier.value=2;
                  },
                  child: Container(
                    width: 42.sp,
                    height: 42.sp,
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                    child:  Center(
                      child: Container(
                        width: 34.w,
                        height: 34.h,
                        decoration: ShapeDecoration(
                          color:  Color(pageState==2?0xFF007BC0:0xFFD9D9D9),
                          shape: const CircleBorder(

                          ),
                        ),
                        child: Center(child: SvgPicture.asset(Assets.tickIcon)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }, valueListenable: AddNotifier.addBusinessNotifier,
        ),
        2.y,
        Row(children: [

          AppText('Business detail', style: Styles.circularStdRegular(
            context,fontSize: 14,fontWeight: FontWeight.w500)),

          const Spacer(),
          AppText('Price and location', style: Styles.circularStdRegular(
              context,fontSize: 14,fontWeight: FontWeight.w500)),
          const Spacer(),
          // Container(
          //   width: 1.sw/10,
          //
          // ),
          AppText('Publish', style: Styles.circularStdRegular(context,fontSize: 14,fontWeight: FontWeight
          .w500
          ))

        ],)
        // Container(
        //   width: 34,
        //   height: 34,
        //   decoration: ShapeDecoration(
        //     color: Color(0xFF007BC0),
        //     shape: OvalBorder(),
        //   ),
        // )
        ,
Expanded(child: PageView(
  physics: const NeverScrollableScrollPhysics(),
controller: AddNotifier.addPageController,
  children: [

BusinessAddDetails(),
      PriceLocation()
      ,const PublishPage()


  ],

))


      ],

  ),
),

      ),
    );
  }
}
