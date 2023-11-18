import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';

class PriceLocation extends StatelessWidget {
   PriceLocation({super.key});
  TextEditingController salePriceController=TextEditingController();

  TextEditingController profileController=TextEditingController();

  TextEditingController revenueController=TextEditingController();
  TextEditingController countryController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController addressController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AddNotifier.addBusinessNotifier.value--;
        AddNotifier.addPageController.jumpToPage(0);
        return  true;

      },
      child: Scaffold(

        bottomNavigationBar: Container(
          color: Colors.transparent
          ,
          height: 56.h,
          child:       CustomButton(onTap: () {

            AddNotifier.addPageController.jumpToPage(2);
            AddNotifier.addBusinessNotifier.value=2;

          },
            borderRadius: 30,
            height: 56,
            text: 'Next' ,),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

            20.y,
            AppText("Sale  price", style: Styles.circularStdMedium(context,fontSize: 20)),
            5.y,
            Form(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                CustomTextFieldWithOnTap(controller: salePriceController, hintText: 'Sale price (\$USD)',

                    borderRadius: 40,


                    // isBorderRequired: false,
                    textInputType: TextInputType.text),
                AppText("Financial detail", style: Styles.circularStdMedium(context,fontSize: 20)),


                /// reveenue text
                ///
                CustomTextFieldWithOnTap(controller: revenueController, hintText: '2023 Revenue (\$CAD)',

                    borderRadius: 40,
                    height: 200.h,
                    //maxline: 10,


                    // isBorderRequired: false,
                    textInputType: TextInputType.text),
                ///profile
                CustomTextFieldWithOnTap(controller: profileController, hintText: '2023 Profile (\$CAD)',

                    borderRadius: 40,
                    height: 200.h,
                    //maxline: 10,


                    // isBorderRequired: false,
                    textInputType: TextInputType.text),

                CustomButton(onTap: (){}, text: "+ Add previous year 2022",width: 180.sp,
                  height: 40.0,
                  textSize:12,
                  borderRadius: 40,textFontWeight: FontWeight.w500,)
                ,
                10.y,
                AppText("Location", style: Styles.circularStdMedium(context,fontSize: 20)),
                Container(width: 380,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.3, color: AppColors.lightGreyColor,),

                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: GeneralizedDropDown(
                      height: 100,
                      width: 100,
                      isFit: true,

                      hint: 'Country',
                      icon: SvgPicture.asset(Assets.dropDownIcon),
                      style: Styles.circularStdRegular(context,fontSize: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      //isBorder: true,
                      items: const ["CountryA","CountryB"], selectedValue: null, onChanged: (onChanged){
                    countryController.text=onChanged.toString();

                  }),
                ),
                10.y,
                Container(width: 380,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.3, color: AppColors.lightGreyColor,),

                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: GeneralizedDropDown(
                      height: 100,
                      width: 100,
                      isFit: true,

                      hint: 'City',
                      icon: SvgPicture.asset(Assets.dropDownIcon),
                      style: Styles.circularStdRegular(context,fontSize: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      //isBorder: true,
                      items: const ["CityA","CityB"], selectedValue: null, onChanged: (onChanged){
                    countryController.text=onChanged.toString();

                  }),
                ),
                10.y,
                CustomTextFieldWithOnTap(controller: addressController, hintText: 'Address',

                    borderRadius: 40,
                    height: 200.h,
                    //maxline: 10,


                    // isBorderRequired: false,
                    textInputType: TextInputType.text),
                10.y,
                CustomTextFieldWithOnTap(controller: addressController, hintText: 'Zip Code',

                    borderRadius: 40,
                    height: 200.h,
                    //maxline: 10,


                    // isBorderRequired: false,
                    textInputType: TextInputType.text),


              ],

            )),


          ],),
        ),
      ),
    );
  }
}
