import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';

class customersupport extends StatelessWidget {
  TextEditingController helpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  customersupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.customerSupport,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.y,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

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
                    hint: 'How can we help you? ',
                      width: 100,
                      isFit: true,
                      icon: SvgPicture.asset(Assets.dropDownIcon),
                      style: Styles.circularStdRegular(context,fontSize: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      //isBorder: true,
                      items: const ["Admin","Advisor"], selectedValue: null, onChanged: (onChanged){
                      helpController.text=onChanged.toString();

                  }),
                ),
//  GeneralizedDropDown(
//   hint: "How can we help you? ",
//   isBorder: true,
//                       height: 100.h,
//                         width: 100.w,
//                         isFit: true,
//                         icon: SvgPicture.asset(Assets.dropDownIcon),
//                         style: Styles.circularStdRegular(context,fontSize: 15),
//                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      
//                         items: const ["Admin","Manager"], selectedValue: null, onChanged: (onChanged){
//                         helpController.text=onChanged.toString();
                  
//                     }),
              
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: nameController,
                      hintText: 'Name',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.message),
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress),
                  CustomTextFieldWithOnTap(
                      maxline: 5,
                      borderRadius: 10.r,
                      controller: remarkController,
                      hintText: 'Remark',
                      textInputType: TextInputType.emailAddress),
                ],
              ),
 
// 189.y,


     AddImageWidget(
      height: 66.h, 
      width: 142.w, 
      onTap: (){
      
     }),

10.y, 
              CustomButton(
                gapWidth: 7.w,
                imageHeight: 20.h,
                imageWidth: 20.w,
                leadingSvgIcon: true,
                width: 320.w,
                borderRadius: 40.r,
                onTap: () {
 
                },
                text: AppStrings.submit,
                bgColor: AppColors.primaryColor,
                textFontWeight: FontWeight.w700,
                textSize: 16.sp,
                textColor: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



 





 

