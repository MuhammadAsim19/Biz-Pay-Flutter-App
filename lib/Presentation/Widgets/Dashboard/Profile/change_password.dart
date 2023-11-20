import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';


class ChangePassword extends StatelessWidget {
  TextEditingController oldpassword= TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    
    appBar: const CustomAppBar(title: AppStrings.changePassword, ),
       
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              40.y,
              Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(AppStrings.oldPassword, style: Styles.circularStdBold(context, color: AppColors.blackColor, 
                  fontSize: 16.sp)),

                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.hide),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.lock),
                      controller: oldpassword,
                      hintText: 'Old Password',
                      textInputType: TextInputType.name),
20.y, 
                      AppText(AppStrings.newPassword, style: Styles.circularStdBold(context, color: AppColors.blackColor, 
                  fontSize: 16.sp)),
                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.hide),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.lock),
                      controller: newpassword,
                      hintText: 'New Password',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.hide),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.lock),
                      controller: confirmpassword,
                      hintText: 'Confirm Password',
                      textInputType: TextInputType.emailAddress),
                ],
              ),
              120.y,
              
              CustomButton(
                gapWidth: 7.w,
                imageHeight: 20.h,
                imageWidth: 20.w,
                leadingSvgIcon: true,
                width: 320.w,
                borderRadius: 40.r,
             onTap: () {

                      CustomDialog.dialog(context, 
                      Container(
                     height: 255.h, width: 380.w,
                    decoration: BoxDecoration( shape: BoxShape.rectangle, 
                    borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.whiteColor,  ),
                    child: Column(mainAxisSize: MainAxisSize.min,
                      children: [
                           Padding(
                             padding:   EdgeInsets.all(18.sp),
                             child: SvgPicture.asset(Assets.roundBluetick, width: 86.w, height: 86.h,),
                           ), 
                           Padding(
                             padding:  EdgeInsets.only(top: 8.sp, bottom: 1 .sp),
                             child: AppText( AppStrings.passwordChangedsuccessfully, maxLine: 2, style: Styles.circularStdRegular(context, fontSize: 24.sp, color: AppColors.primaryColor)),
                           ),
                           Padding(
                             padding:   EdgeInsets.all(8.sp),
                             child: AppText(AppStrings.youHavesuccessfully, maxLine: 2, style: Styles.circularStdRegular(context, fontSize: 16.sp, 
                             color: AppColors.greyMedium)),
                           ), 
                    
                    ],),
                  )
                      );

                

                },
                text: AppStrings.update,
                bgColor: AppColors.primaryColor,
                textFontWeight: FontWeight.w700,
                textSize: 16.sp,
                textColor:AppColors.whiteColor,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}

 
