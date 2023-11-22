import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Data/DataSource/Resources/utils.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_and_terms_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/PrivacyAndTerms/Components/privacy_and_terms_tile.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});

  // title: '',points: Points(title: "",  list: [ListElement(title: "Overview: ",icon: "1.")])

  List<PrivacyAndTermsModel> data = [
    PrivacyAndTermsModel(
        title: '1. Overview:',
        description:
            '"BuySellBiz" is committed to safeguarding your privacy. This Privacy Policy outlines how we collect, use, disclose, and manage your personal information in connection with our mobile application.'),
    PrivacyAndTermsModel(
      title: '2. Information We Collect:',
      points: Points(list: [
        ListElement(
          title: 'a. Account Information:',
          desc:
              "For Sellers: Name, business details, contact information, financial information. - For Buyers: Name, contact information.",
        ),
        ListElement(
            title: 'b. Device Information: ',
            desc:
                "Device type, operating system, and unique device identifiers."),
        ListElement(
            title: 'c. Usage Information: ',
            desc:
                "Interactions with the app, pages viewed, features used, and other analytical data."),
        ListElement(
            title: 'd. Location Information: ',
            desc:
                "If enabled, we may collect your device's location to provide location-based services."),
      ]),
    ),
    PrivacyAndTermsModel(
      title: '3. How We Use Your Information:',
      points: Points(list: [
        ListElement(
          title: 'a. For Business Transactions:',
          desc:
              "For Sellers: Name, business details, contact information, financial information. - For Buyers: Name, contact information.",
        ),
        ListElement(
            title: 'b. To Improve Our Services:',
            desc:
                "Device type, operating system, and unique device identifiers."),
        ListElement(
            title: 'c. Usage Information: ',
            desc:
                "Interactions with the app, pages viewed, features used, and other analytical data."),
        ListElement(
            title: 'd. Communication: ',
            desc:
                "If enabled, we may collect your device's location to provide location-based services."),
      ]),
      // PrivacyAndTermsModel(
      //     title: '3.Buying and Selling Businesses:',
      //     description:
      //         "You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account."),
      // PrivacyAndTermsModel(
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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.privacyPolicy,
          leading: true,
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 5.h,
              );
            },
            itemCount: data.length,
            itemBuilder: (context, index) =>
                TermsAndPrivacyTextTile(data: data[index])));
  }
}
