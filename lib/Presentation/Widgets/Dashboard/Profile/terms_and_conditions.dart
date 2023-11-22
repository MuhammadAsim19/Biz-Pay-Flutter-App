import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_and_terms_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/PrivacyAndTerms/Components/privacy_and_terms_tile.dart';

// class TermsAndConditions extends StatelessWidget {
//   TermsAndConditions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: AppStrings.termsAndconditions,
//       ),
//       body:   SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(15.sp),
//           child: Column(
//             children: [
//               Text(
//                 AppStrings.privacyPolicyall,
//                 style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({super.key});

  // title: '',points: Points(title: "",  list: [ListElement(title: "Overview: ",icon: "1.")])

  final List<PrivacyAndTermsModel> data = [
    PrivacyAndTermsModel(
      description:
          'Please read these terms and conditions carefully before using the "BuySellBiz" mobile application.',
    ),

    PrivacyAndTermsModel(
        title: '1. Acceptance of Terms:',
        description:
            '. By accessing or using the "BuySellBiz" app, you agree to be bound by these terms and conditions.'),
    PrivacyAndTermsModel(
      title: '2. Account Registration:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                '. You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                '. To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),
    PrivacyAndTermsModel(
      title: '2. Account Registration:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                '. You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                '. To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),

    PrivacyAndTermsModel(
      title: '3. User Conduct:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                '. You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                '. To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),
    PrivacyAndTermsModel(
      title: '4: Buying and Selling Businesses:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                '. You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                '. To use certain features of the app, you may be required to register for an account.'),
      ]),
    ),
    PrivacyAndTermsModel(
      title: '5: Communication:',
      points: Points(list: [
        ListElement(
            title: '',
            desc:
                '. You agree to provide accurate, current, and complete information during the registration process.'),
        ListElement(
            title: '',
            desc:
                '. To use certain features of the app, you may be required to register for an account.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.termsAndconditions,
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 5.sp,
              );
            },
            itemCount: data.length,
            itemBuilder: (context, index) =>
                TermsAndPrivacyTextTile(data: data[index])));
  }
}
