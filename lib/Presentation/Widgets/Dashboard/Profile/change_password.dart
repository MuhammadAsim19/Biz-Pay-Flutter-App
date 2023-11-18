import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';



class ChangePassword extends StatelessWidget {
  TextEditingController oldpassword= TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
 
  

ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    
    appBar: const CustomAppBar(title: AppStrings.changepassword, ),
       
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [

              40.y,
              Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(AppStrings.oldpassword, style: Styles.circularStdBold(context, color: AppColors.blackColor, 
                  fontSize: 16.sp)),

                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.hide),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.lock),
                      controller: oldpassword,
                      hintText: 'Old Password',
                      textInputType: TextInputType.name),

20.y, 
                      AppText(AppStrings.newpassword, style: Styles.circularStdBold(context, color: AppColors.blackColor, 
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
                onTap: () {},
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

class customappbar extends StatelessWidget {
  const customappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: true, title: AppText(AppStrings.Changepass, style: Styles.circularStdMedium(context, fontSize: 18.sp, )),
    backgroundColor: AppColors.whiteColor, 
    leading: SvgPicture.asset(Assets.arrowleft, width: 10.w, height: 10.h,), 
    iconTheme: const IconThemeData(color: AppColors.blackColor), 
    elevation: 0.sp,
    );
  }
}
