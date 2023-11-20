import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
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
            children: [
              40.y,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: helpController,
                      hintText: 'How can we help you? ',
                      suffixIcon: SvgPicture.asset(Assets.arrowDown),
                      textInputType: TextInputType.name),
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



 





 

