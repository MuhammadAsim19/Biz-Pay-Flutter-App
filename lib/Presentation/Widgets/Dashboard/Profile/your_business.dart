import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Data/DataSource/Resources/utils.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/pop_munu.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/bussines_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_popup_menu.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/change_password.dart';

class YourBusiness extends StatelessWidget {
  List<BusinessProductModel> businessProducts = [
    BusinessProductModel(
        businessImage: Assets.businessimage1,
        businessName: 'Drop shipping website & E-commerce business',
        price: '\$40k USD',
        location: "San Francisco, USA"),
    BusinessProductModel(
        businessImage: Assets.businessimage2,
        businessName: 'Drop shipping website & E-commerce business',
        price: '\$40k USD',
        location: "San Francisco, USA"),
    BusinessProductModel(
        businessImage: Assets.businessimage3,
        businessName: 'Drop shipping website & E-commerce business',
        price: '\$40k USD',
        location: "San Francisco, USA"),
    BusinessProductModel(
        businessImage: Assets.businessimage2,
        businessName: 'Drop shipping website & E-commerce business',
        price: '\$40k USD',
        location: "San Francisco, USA"),
  ];

  YourBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.yourBusiness,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 0.90.sh,
          width: 1.sw,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10.sp,
              );
            },
            padding: EdgeInsets.only(
                left: 20.sp, right: 20.sp, bottom: 20.sp, top: 20.sp),
            itemCount: businessProducts.length,
            itemBuilder: (context, index) {
              return BussinesList(
                index: index,
                businessProducts: businessProducts,
                getData: (BusinessProductModel val) {},
              );
            },
          ),
        ),
      ),
    );
  }
}
