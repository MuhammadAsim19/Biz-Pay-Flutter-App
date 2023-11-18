import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/change_password.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/customer_support.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/personal_information.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/privacy_policy.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/terms_and_conditions.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/your_business.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            children: [
              60.y,
               const AssetImageWidget(
                url: Assets.person,
                radius: 60,
                isCircle: true,
              ),
              10.y,
              Text(
                AppStrings.Gabriel,
                style: Styles.circularStdBold(context, fontSize: 20.sp),
              ),
              20.y,
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigate.to(context, PersonalInformation());
                    },

                    child: const CustomListTile(
                      title: AppStrings.personalinfo,
                      leadingicon: Assets.profile,
                      trailing: Assets.down,
                    ),
                  ),


                  GestureDetector(
                    onTap: (){
                      Navigate.to(context, ChangePassword()); 
                    },
                    child: const CustomListTile(
                      title: AppStrings.Changepass,
                      leadingicon: Assets.unlock,
                      trailing: Assets.down,
                    ),
                  ),
                  
                  GestureDetector(
                    onTap: (){
                      Navigate.to(context, YourBusiness());
                    },
                    child: const CustomListTile(
                      title: AppStrings.listyourbis,
                      leadingicon: Assets.plus,
                      trailing: Assets.down,
                    ),
                  ),


                GestureDetector(
  onTap: () async {
    final url = 'https://wa.me/?text=Check out my awesome Flutter app!';
    final encoded = Uri.encodeFull(url);
    await Share.share(encoded);
  },
  child: const CustomListTile(
    title: AppStrings.referafri,
    leadingicon: Assets.share,
    trailing: Assets.down,
  ),
),


                  GestureDetector(
                    onTap: (){
                      Navigate.to(context, PrivacyPolicy());
                    },
                    child: const CustomListTile(
                      title: AppStrings.privacypol,
                      leadingicon: Assets.document,
                      trailing: Assets.down,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigate.to(context,TermsAndConditions()); 
                    },
                    child: const CustomListTile(
                      title: AppStrings.termsandcon,
                      leadingicon: Assets.paper,
                      trailing: Assets.down,
                    ),
                  ),
                  GestureDetector(onTap: (){
                    Navigate.to(context, customersupport());
                  },
                    child: const CustomListTile(
                      title: AppStrings.helpandsupp,
                      leadingicon: Assets.alert,
                      trailing: Assets.down,
                    ),
                  ),
                ],
              ),
              50.y,
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

              20.y,

              AppText('Version 1.1.02',
                  style: Styles.circularStdRegular(context,
                      fontSize: 12.sp, color: AppColors.greyColor)),
              30.y,
            ],
          ),
        ),
      ),
    );
  }
}
