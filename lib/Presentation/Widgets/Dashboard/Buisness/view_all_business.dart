import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/bussines_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';

class ViewAllBusiness extends StatefulWidget {
  List<BusinessModel>? model;

  ViewAllBusiness({super.key, this.model});

  @override
  State<ViewAllBusiness> createState() => _ViewAllBusinessState();
}

class _ViewAllBusinessState extends State<ViewAllBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.yourBusiness,
          leading: true,
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 25.sp,
              );
            },
            padding: EdgeInsets.only(
                left: 20.sp, right: 20.sp, bottom: 20.sp, top: 20.sp),
            itemCount: widget.model!.length,
            itemBuilder: (context, index) {
              return BussinesList(
                index: index,
                businessProducts: widget.model,
                getData: (BusinessModel val) {
                  Navigate.to(
                      context,
                      BusinessDetails(
                        modelData: val,
                        id: val.id,
                      ));
                },
              );
            },
          ),
        ));
  }
}
