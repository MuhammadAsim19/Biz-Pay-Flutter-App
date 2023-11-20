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
   

List<PrivacyAndTermsModel> data=[
  
    PrivacyAndTermsModel(
  
   title: '1. Overview:',    description: '"BuySellBiz" is committed to safeguarding your privacy. This Privacy Policy outlines how we collect, use, disclose, and manage your personal information in connection with our mobile application.'

  ), 

 PrivacyAndTermsModel(
  
   title: '2. Information We Collect:',  
    points: Points(
      title: "a. Account Information:-  For Sellers: Name, business details, contact information, financial information. - For Buyers: Name, contact information.", list: [ListElement(
      icon: 'b.', title: 'Device information', 
     ), 
    ListElement(
       icon: 'c.', title: 'Usage Information', 
    ), 
    
    ]), 
  ), 


   PrivacyAndTermsModel(
  
   title: '1. Overview:',    description: '"BuySellBiz" is committed to safeguarding your privacy. This Privacy Policy outlines how we collect, use, disclose, and manage your personal information in connection with our mobile application.'

  ), 

 PrivacyAndTermsModel(
  
   title: '2. Information We Collect:',  
    points: Points(
      title: "a. Account Information:-  For Sellers: Name, business details, contact information, financial information. - For Buyers: Name, contact information.", list: [ListElement(
      icon: 'b.', title: 'Device information', 
     ), 
    ListElement(
       icon: 'c.', title: 'Usage Information', 
    ), 
    
    ]), 
  ), 

      
   


  
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.privacyPolicy,
      ),
      body:ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index)=>TermsAndPrivacyTextTile(data:data[index] )
    ));
  }
}
