import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class CustomBottomSheet {
  showBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.whiteColor,
        context: context,
        builder: (BuildContext context) {
          return child;
        });
  }
}
