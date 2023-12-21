import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

import 'package:buysellbiz/Presentation/Widgets/Dashboard/Saved/Components/saved_business.dart';

class SavedListing extends StatelessWidget {
  const SavedListing({super.key});
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
              const SavedListBusiness(),
              30.y,
            ],
          ),
        ),
      ),
    );
  }
}
