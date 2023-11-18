import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';

class PersonalInformation extends StatelessWidget {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController calendarcontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();

  PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: AppStrings.personalinfo, ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              40.y,
            
 
              Stack(
                children: [
                  const AssetImageWidget(
                    url: Assets.person,
                    radius: 60,
                    isCircle: true,
                  ),
                  Positioned(
                      top: 75.h,
                      left: 90.w,
                      child: SvgPicture.asset(Assets.blueElipse)),
                  Positioned(
                      top: 85.h,
                      left: 100.w,
                      child: SvgPicture.asset(Assets.edit)),
                ],
              ),
              20.y,
              Column(
                children: [
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: firstnamecontroller,
                      hintText: 'Gabriel',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: lastnamecontroller,
                      hintText: 'Tesse',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.blueCheck),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.message),
                      controller: emailcontroller,
                      hintText: 'gabriel.example@gmail.com',
                      textInputType: TextInputType.emailAddress),
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.calender),
                      controller: calendarcontroller,
                      hintText: '22/09/96',
                      textInputType: TextInputType.datetime),
                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.arrowDown),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.location),
                      controller: countrycontroller,
                      hintText: 'Country',
                      textInputType: TextInputType.name),
                ],
              ),
              50.y,
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
                textColor: AppColors.whiteColor,
              ),
              20.y,
              AppText('Delete my account',
                  style: Styles.circularStdMedium(context,
                      fontSize: 16.sp, color: AppColors.redColor)),
              30.y,
            ],
          ),
        ),
      ),
    );
  }
}
