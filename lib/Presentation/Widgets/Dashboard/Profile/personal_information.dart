import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

   

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            // Spacer(), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Assets.arrowleft), 
                Center(child: AppText(AppStrings.personalinfo, style: Styles.circularStdMedium(context, fontSize: 18.sp))), 
            ],),
            SizedBox(
              height: 40.h,
            ),
            Image.asset(Assets.person),
            SizedBox(height: 10.h),
            Text(
              AppStrings.Gabriel,
              style: Styles.circularStdBold(context, fontSize: 20.sp),
            ),
            SizedBox(height: 20.h),
            const Column(
              children: [
                CustomListTile(
                  title: AppStrings.personalinfo,
                  leadingicon: Assets.profile,
                  trailing: Assets.down,
                ),
                CustomListTile(
                  title: AppStrings.Changepass,
                  leadingicon: Assets.unlock,
                  trailing: Assets.down,
                ),
                CustomListTile(
                  title: AppStrings.listyourbis,
                  leadingicon: Assets.plus,
                  trailing: Assets.down,
                ),
                CustomListTile(
                  title: AppStrings.referafri,
                  leadingicon: Assets.share,
                  trailing: Assets.down,
                ),
                CustomListTile(
                  title: AppStrings.privacypol,
                  leadingicon: Assets.document,
                  trailing: Assets.down,
                ),
                CustomListTile(
                  title: AppStrings.termsandcon,
                  leadingicon: Assets.paper,
                  trailing: Assets.down,
                ),
                CustomListTile(
                  title: AppStrings.helpandsupp,
                  leadingicon: Assets.alert,
                  trailing: Assets.down,
                ),
              ],

            ),

            SizedBox(height: 50.h),

            CustomButton(
              gapWidth: 7.w,
              imageHeight: 20.h,
              imageWidth: 20.w, 
              leadingIcon: Assets.logout,
              leadingSvgIcon: true,
              width: 230.w,
              borderRadius: 40.r,
              onTap: () {},
              text: AppStrings.Logout,
              bgColor: AppColors.whiteColor,
              textFontWeight: FontWeight.w700,
              textSize: 16.sp,
              textColor: AppColors.greyMedium,
            ),

            SizedBox(
              height: 20.h,
            ),

AppText('Version 1.1.02', style: Styles.circularStdRegular(context, fontSize: 12.sp, color: AppColors.greyColor)),
SizedBox(height: 30.h,),
          ],
          
        ),
      ),
    );
  }
}
