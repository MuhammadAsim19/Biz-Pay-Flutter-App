import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/saved_loading.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/bussines_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/ListBusiness/your_business_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YourBusiness extends StatefulWidget {
  // List<BusinessProductModel> businessProducts = [
  //   BusinessProductModel(
  //       businessImage: Assets.businessimage1,
  //       businessName: 'Drop shipping website & E-commerce business',
  //       price: '\$40k USD',
  //       location: "San Francisco, USA"),
  //   BusinessProductModel(
  //       businessImage: Assets.businessimage2,
  //       businessName: 'Drop shipping website & E-commerce business',
  //       price: '\$40k USD',
  //       location: "San Francisco, USA"),
  //   BusinessProductModel(
  //       businessImage: Assets.businessimage3,
  //       businessName: 'Drop shipping website & E-commerce business',
  //       price: '\$40k USD',
  //       location: "San Francisco, USA"),
  //   BusinessProductModel(
  //       businessImage: Assets.businessimage2,
  //       businessName: 'Drop shipping website & E-commerce business',
  //       price: '\$40k USD',
  //       location: "San Francisco, USA"),
  // ];

  const YourBusiness({super.key});

  @override
  State<YourBusiness> createState() => _YourBusinessState();
}

class _YourBusinessState extends State<YourBusiness> {
  @override
  void initState() {
    context.read<YourBusinessCubit>().getBusinessList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.yourBusiness,
        leading: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocConsumer<YourBusinessCubit, YourBusinessState>(
          listener: (context, state) {
            if (state is YourBusinessError) {
              WidgetFunctions.instance
                  .showErrorSnackBar(context: context, error: state.error);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is YourBusinessLoaded) {
              return SizedBox(
                height: 0.90.sh,
                width: 1.sw,
                child: state.business!.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 25.sp,
                          );
                        },
                        padding: EdgeInsets.only(
                            left: 20.sp,
                            right: 20.sp,
                            bottom: 20.sp,
                            top: 20.sp),
                        itemCount: state.business!.length,
                        itemBuilder: (context, index) {
                          return BusinessList(
                            isFromAllBusiness: false,
                            index: index,
                            businessProducts: state.business,
                            getData: (BusinessModel val) {
                              Navigate.to(
                                  context,
                                  BusinessDetails(
                                    id: state.business![index].id,
                                  ));
                            },
                          );
                        },
                      )
                    : Center(
                        child: AppText(
                          'Data Not found',
                          style: Styles.circularStdRegular(context,
                              fontSize: 14.sp),
                        ),
                      ),
              );
            } else if (state is YourBusinessLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: const SavedLoading(),
              );
            } else if (state is YourBusinessError) {
              return Center(
                  child: AppText(state.error!,
                      style: Styles.circularStdRegular(context)));
            } else {
              return 10.x;
            }
          },
        ),
      ),
    );
  }
}
