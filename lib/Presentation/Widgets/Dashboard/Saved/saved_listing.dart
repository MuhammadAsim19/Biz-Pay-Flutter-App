import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/recently_view.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Saved/Components/saved_business.dart';

class SavedListing extends StatelessWidget {
  SavedListing({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: AppText(
          "Saved List",
          style: Styles.circularStdMedium(context, fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            children: [
              10.y,
              SavedListBusiness(
            
              ),
              30.y,
            ],
          ),
        ),
      ),
    );
  }
}
