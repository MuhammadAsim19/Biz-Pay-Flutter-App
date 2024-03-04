import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/AppBadges/app_badges.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/logout_dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/export_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/change_password.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/customer_support.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/personal_information.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/terms_and_conditions.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/your_business.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Column(
              children: [
                40.y,
                Data.app.user?.user?.profilePic != null
                    ? CachedImage(
                        radius: 55.sp,
                        url: Data.app.user!.user!.profilePic!.contains('https')
                            ? "${Data.app.user?.user!.profilePic}"
                            : "${ApiConstant.baseurl}${Data.app.user?.user!.profilePic}")
                    : CachedImage(
                        radius: 55.sp,
                        url:
                            "http://18.118.10.44:8000//assets/user_profile.png"),
                Column(
                  children: [
                    10.y,
                    Text(
                      Data.app.user?.user?.fullName ?? "",
                      style: Styles.circularStdBold(context, fontSize: 20.sp),
                    ),
                    20.y,
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigate.to(context, const PersonalInformation());
                          },
                          child: const CustomListTile(
                            title: AppStrings.personalLinfo,
                            leadingicon: Assets.profile,
                            trailing: Assets.down,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigate.to(context, const AppBadgesScreen());
                          },
                          child: const CustomListTile(
                            title: 'App Badges',
                            leadingicon: Assets.appBadges,
                            trailing: Assets.down,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigate.to(context, const ExportProfile());
                          },
                          child: const CustomListTile(
                            title: AppStrings.becomeExpert,
                            leadingicon: Assets.addUser,
                            trailing: Assets.down,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigate.to(context, ChangePassword());
                          },
                          child: const CustomListTile(
                            title: AppStrings.ChangePass,
                            leadingicon: Assets.unlock,
                            trailing: Assets.down,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigate.to(context, const YourBusiness());
                          },
                          child: const CustomListTile(
                            title: AppStrings.listYourbis,
                            leadingicon: Assets.plus,
                            trailing: Assets.down,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            const url =
                                'https://play.google.com/store/apps/details?id=com.buysellbiz.application.buysellbiz';
                            final encoded = Uri.encodeFull(url);
                            await Share.share(encoded);
                          },
                          child: const CustomListTile(
                            title: AppStrings.referAfri,
                            leadingicon: Assets.share,
                            trailing: Assets.down,
                          ),
                        ),

                        ///Privacy policy
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigate.to(context, PrivacyPolicy());
                        //   },
                        //   child: const CustomListTile(
                        //     title: AppStrings.privacyPol,
                        //     leadingicon: Assets.document,
                        //     trailing: Assets.down,
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigate.to(context, TermsAndConditions());
                          },
                          child: const CustomListTile(
                            title: AppStrings.termsAndcon,
                            leadingicon: Assets.paper,
                            trailing: Assets.down,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigate.to(context, const CustomerSupport());
                          },
                          child: const CustomListTile(
                            title: AppStrings.helpAandupp,
                            leadingicon: Assets.alert,
                            trailing: Assets.down,
                          ),
                        ),
                      ],
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
                  onTap: () {
                    CustomDialog.dialog(
                        barrierDismissible: true,
                        context,
                        const LogoutDialog());
                  },
                  text: AppStrings.logout,
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
      ),
    );
  }
}
