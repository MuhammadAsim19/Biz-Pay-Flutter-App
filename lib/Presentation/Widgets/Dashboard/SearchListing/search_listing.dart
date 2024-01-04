import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/ContextWidgets/bottom_sheet.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/business_shimmer.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Category/Controller/category_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/chat.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/SearchListing/Components/filter_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'Components/search_business_widget.dart';

class SearchListing extends StatefulWidget {
  final String title;
  final String id;

  const SearchListing({super.key, required this.title, required this.id});

  @override
  State<SearchListing> createState() => _SearchListingState();
}

class _SearchListingState extends State<SearchListing> {
  final List<String> countryList = ["CountryA", "China", "PAKISTAN"];

  final List<String> priceList = [
    "0-1000\$",
    '1000-100000 \$',
    "100000-1000000\$"
  ];

  final List<String> categoryList = [
    "Food",
    "RealState",
    "Maufacture",
    "Online"
  ];

  final List<String> revenueList = ["10k", "20k", "30k"];

  List<BusinessModel>? businessProducts1;

  List<BusinessModel> filterData = [];

  @override
  void initState() {
    context.read<CategoryBusinessCubit>().getCategoryBusiness(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigate.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              Assets.arrowBackIcon,
              width: 10.sp,
              height: 10.sp,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        leadingWidth: 40.sp,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: AppText(
          widget.title,
          style: Styles.circularStdRegular(context,
              fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///top Categories $ filters
            ///
            //  ListView.separated(itemBuilder: (), separatorBuilder: separatorBuilder, itemCount: itemCount)
            10.y,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  // 10.x,
                  WidgetFunctions.instance.dropDown(context,
                      values: countryList,
                      titles: countryList,
                      placeholder: "Country", onChange: (c) {
                    _filterByCountry(c.toString());
                  }, width: 110),
                  10.x,
                  // WidgetFunctions.instance.dropDown(context,
                  //     values: categoryList,
                  //     titles: categoryList,
                  //     placeholder: "Categories",
                  //     onChange: (c) {},
                  //     width: 120),
                  // 10.x,
                  FilterButtons(
                      value: 'Price',
                      onTap: () {
                        _filterBottomSheet((value) {
                          _filterByPrice(value);
                        });
                      }),
                  10.x,
                  FilterButtons(
                      value: 'Revenue',
                      onTap: () {
                        _filterBottomSheet((value) {
                          _filterByRevenue(value);
                        });
                      }),
                ],
              ),
            ),

            15.y,
            Expanded(
                child:
                    BlocConsumer<CategoryBusinessCubit, CategoryBusinessState>(
              listener: (context, state) {
                if (state is CategoryBusinessLoaded) {
                  filterData = state.business!;
                  businessProducts1 = state.business;
                }
                if (state is CategoryBusinessError) {
                  WidgetFunctions.instance
                      .showErrorSnackBar(context: context, error: state.error);
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                return state is CategoryBusinessLoading
                    ? BusinessLoading(
                        direction: Axis.vertical,
                      )
                    : state is CategoryBusinessLoaded
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText("${filterData.length} Business",
                                  style: Styles.circularStdMedium(context,
                                      fontSize: 16)),
                              5.y,
                              Expanded(
                                child: SearchBusinessWidget(
                                  businessProducts: filterData,
                                  getData: (BusinessModel val) {
                                    Navigate.to(
                                        context,
                                        BusinessDetails(
                                          modelData: val,
                                          id: val.id,
                                        ));
                                  },
                                  chatTap: (BusinessModel val) {
                                    //BottomNotifier.bottomPageController.removeListener(() { });
                                    // BottomNotifier.bottomPageController=PageController(initialPage: 2);
                                    // BottomNotifier.bottomNavigationNotifier.value=2;
                                    //
                                    // Navigate.toReplace(context, const BottomNavigationScreen(initialPage: 2,));

                                    Navigate.to(
                                        context,
                                        ChatScreen(
                                          backButton: true,
                                        ));
                                  },
                                ),
                              ),
                            ],
                          )
                        : state is CategoryBusinessError
                            ? Align(
                                alignment: Alignment.bottomCenter,
                                child: AppText(state.error!,
                                    style: Styles.circularStdRegular(context)),
                              )
                            : 10.y;
              },
            ))
          ],
        ),
      ),
    );
  }

  _filterBottomSheet(Function(double value) onChange) {
    double value1 = 10;

    CustomBottomSheet().showBottomSheet(context,
        StatefulBuilder(builder: (context, state) {
      return SizedBox(
        height: 1.sh / 2,
        width: 1.sw,
        child: Center(
          // ignore: missing_required_param
          child: SfSlider(
            onChangeEnd: (va) {
              Navigator.pop(context);
            },
            activeColor: AppColors.primaryColor,
            min: 0.0,
            max: 500.0,
            value: value1,
            interval: 100,
            showTicks: false,
            showLabels: true,
            onChanged: (value) {
              print("da value da aw hasi demode kohlrabi$value1");
              state(() {
                value1 = value;
              });
              onChange(value);
            },
          ),
        ),
      );
    }));
  }

  _filterByCountry(String query) {
    print(query);

    filterData = businessProducts1!
        .where(
            (element) => element.country!.toLowerCase() == query.toLowerCase())
        .toList();

    setState(() {});
  }

  // _filterByProfit(query) {
  //   filterData = businessProducts1!.where((item) => item.p == query).toList();
  // }

  _filterByRevenue(double query) {
    print('Here is your Query $query');

    filterData = businessProducts1!
        .where((item) => item.salePrice! > 0 && item.salePrice! > query.toInt())
        .toList();

    print(businessProducts1![0].salePrice);

    setState(() {});
  }

  _filterByPrice(double query) {
    filterData = businessProducts1!
        .where(
            (item) => item.salePrice! >= 0 && item.salePrice! > query.toInt())
        .toList();

    setState(() {});
  }
}
