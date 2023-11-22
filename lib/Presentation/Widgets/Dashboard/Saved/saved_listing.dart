import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/recently_view.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Saved/Components/saved_business.dart';
class SavedListing extends StatelessWidget {
   SavedListing({super.key});
  List<BusinessProductModel>  businessProducts =[
    BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 40K',location: "San Francisco, USA",isFav: true),
    BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 30K',location: "San Francisco, USA",isFav: false
    ),
    BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 20K',location: "San Francisco, USA",isFav: false),
    BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 10K',location: "San Francisco, USA"),
    BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 10K',location: "San Francisco, USA"),
    BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 10K',location: "San Francisco, USA"),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: 
      AppBar(centerTitle: true
        
        ,
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: AppText("Saved List",style: Styles.circularStdMedium(context,fontSize: 18.sp),)
        ,),

body: SingleChildScrollView(
  physics: const BouncingScrollPhysics(),
  child:   Padding(
    padding:  EdgeInsets.symmetric(horizontal: 24.sp),
    child: Column(children: [
    10.y,
      SavedListBusiness(businessProducts: businessProducts, getData: (dto)
      {

        Navigate.to(context,const BusinessDetails());

      }),


    ],),
  ),
),
    );
  }
}
