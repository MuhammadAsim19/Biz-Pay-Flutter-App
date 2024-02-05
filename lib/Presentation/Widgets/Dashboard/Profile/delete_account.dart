import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_and_terms_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/login.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/login_onboard.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/delete_dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/logout_dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/DeleteAccount/delete_account_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/PrivacyAndTerms/Components/privacy_and_terms_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccount extends StatelessWidget {
  DeleteAccount({super.key});

  final List<PrivacyAndTermsModel> data = [
    PrivacyAndTermsModel(
        description:
            "When you choose to delete your \"BuySellBiz\" account, it's important to understand the implications:\n"),

    PrivacyAndTermsModel(
      points: Points(list: [
        ListElement(
            title: '1. Permanent Data Deletion:',
            desc:
                ' You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                ' To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),
    PrivacyAndTermsModel(
      title: '2. Transactions and Communications:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                ' You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                ' To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),

    PrivacyAndTermsModel(
      title: '3. Irreversible Process:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                ' You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                ' To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),
    PrivacyAndTermsModel(
      title: '4: Communication Cessation:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                ' You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                ' To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),
    PrivacyAndTermsModel(
      title: '5: Rejoining the Platform:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                ' You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                ' To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),

    //   title: '4. Communication:',
    //   points: Points(
    //       title:
    //           "a. Account Information:-  For Sellers: Name, business details, contact information, financial information. - For Buyers: Name, contact information.",
    //       list: [
    //         ListElement(
    //           icon: 'b.',
    //           title: 'Device information',
    //         ),
    //         ListElement(
    //           icon: 'c.',
    //           title: 'Usage Information',
    //         ),
    //       ]),
    // ),
  ];

// List<PrivacyAndTermsModel> data=[
//
//     PrivacyAndTermsModel(
//
//    title: '1. Overview:',    description: '"BuySellBiz" is committed to safeguarding your privacy. This Privacy Policy outlines how we collect, use, disclose, and manage your personal information in connection with our mobile application.'
//
//   ),
//
//  PrivacyAndTermsModel(
//
//    title: '2. Information We Collect:',
//     points: Points(
//       title: "a. Account Information:-  For Sellers: Name, business details, contact information, financial information. - For Buyers: Name, contact information.", list: [ListElement(
//       icon: 'b.', title: 'Device information',
//      ),
//     ListElement(
//        icon: 'c.', title: 'Usage Information',
//     ),
//
//     ]),
//   ),
//
//
//    PrivacyAndTermsModel(
//
//    title: '1. Overview:',    description: '"BuySellBiz" is committed to safeguarding your privacy. This Privacy Policy outlines how we collect, use, disclose, and manage your personal information in connection with our mobile application.'
//
//   ),
//
//  PrivacyAndTermsModel(
//
//    title: '2. Information We Collect:',
//     points: Points(
//       title: "a. Account Information:-  For Sellers: Name, business details, contact information, financial information. - For Buyers: Name, contact information.", list: [ListElement(
//       icon: 'b.', title: 'Device information',
//      ),
//     ListElement(
//        icon: 'c.', title: 'Usage Information',
//     ),
//
//     ]),
//   ),
//
//
//   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.deleteAccount,
          leading: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          TermsAndPrivacyTextTile(data: data[index])),
                  60.y
                ],
              ),
            ),
            Positioned(
                bottom: 15.sp,
                left: 15.sp,
                right: 15.sp,
                child: BlocListener<DeleteAccountCubit, DeleteAccountState>(
                  listener: (context, state) {
                    if (state is DeleteAccountLoading) {
                      LoadingDialog.showLoadingDialog(context);
                    }
                    if (state is DeleteAccountLoaded) {
                      Navigate.pop(context);
                      CustomDialog.dialog(context, const DeleteDialog(),
                          barrierDismissible: true);
                      Future.delayed(const Duration(seconds: 2), () {
                        SharedPrefs.clearUserData();
                        Navigator.pop(context);
                        Navigate.toReplaceAll(context, const LoginOnboard());
                      });
                    }
                    if (state is DeleteAccountError) {
                      Navigate.pop(context);
                      WidgetFunctions.instance.showErrorSnackBar(
                          context: context, error: state.error);
                    }
                  },
                  child: CustomButton(
                    onTap: () {
                      CustomDialog.dialog(context, const ConfirmDeleteDialog(),
                          barrierDismissible: true);
                    },
                    text: 'Delete Account',
                    borderRadius: 50.r,
                    bgColor: AppColors.redColor,
                    isBorder: false,
                  ),
                ))
          ],
        ));
  }
}
