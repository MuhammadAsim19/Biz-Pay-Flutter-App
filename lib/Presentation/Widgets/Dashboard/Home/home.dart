import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/AppData/app_initializer.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisness_profile.dart';
import 'package:buysellbiz/Domain/Category/categroy.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/broker_loading.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/business_shimmer.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/category_loading.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/recently_viewd_bussines_loading.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BottomNavigation/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BrokerProfile/broker_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Category/all_categories.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/BusinessBroker/Profile/business_profile_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/Category/categories_list.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/for_you_buisiness.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/recently_added.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/recently_view.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Brokers/brokers_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/OnlineBusiness/online_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/RecentlyView/recently_viewed_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/search_busniess.dart';

import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notifications.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/SearchListing/search_listing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Controller/Categories/category_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController searchController = TextEditingController();

List<String> countryList = ['USA', 'China', 'PAK'];
String? selectedListItem;

// List<Category> categoryData = [
//   Category(
//       icon: Assets.foodBeverageIcon,
//       title: "Food & Beverage",
//       backgroundcolor: "0xFFEAF1FD"),
//   Category(
//       icon: Assets.fashionIcon,
//       : "Fashion",
//       backgroundColor: 0xFFEDF5ED),
//   CategoryDummy(
//       catPic: Assets.retailIcon,
//       catName: "Retail",
//       backgroundColor: 0xFFFCEDE9),
//   CategoryDummy(
//       catPic: Assets.serviceIcon,
//       catName: "Service",
//       backgroundColor: 0xFFF0F6F4),
//   CategoryDummy(
//       catPic: Assets.educationIcon,
//       catName: "Education",
//       backgroundColor: 0xFFE5F2F9),
//   CategoryDummy(
//       catPic: Assets.entertainmentIcon,
//       catName: "Entertainment",
//       backgroundColor: 0xFFFAF0EE),
//   CategoryDummy(
//       catPic: Assets.informationTech,
//       catName: "Information Technology",
//       backgroundColor: 0xFFFBF3ED),
//   CategoryDummy(
//       catPic: Assets.moreIcon, catName: "More", backgroundColor: 0xFFFEF3E8)
// ];
// List<CategoryDummy> categoryFullData = [
//   CategoryDummy(
//       catPic: Assets.foodBeverageIcon,
//       catName: "Food & Beverage",
//       backgroundColor: 0xFFEAF1FD),
//   CategoryDummy(
//       catPic: Assets.fashionIcon,
//       catName: "Fashion",
//       backgroundColor: 0xFFEDF5ED),
//   CategoryDummy(
//       catPic: Assets.retailIcon,
//       catName: "Retail",
//       backgroundColor: 0xFFFCEDE9),
//   CategoryDummy(
//       catPic: Assets.serviceIcon,
//       catName: "Service",
//       backgroundColor: 0xFFF0F6F4),
//   CategoryDummy(
//       catPic: Assets.educationIcon,
//       catName: "Education",
//       backgroundColor: 0xFFE5F2F9),
//   CategoryDummy(
//       catPic: Assets.entertainmentIcon,
//       catName: "Entertainment",
//       backgroundColor: 0xFFFAF0EE),
//   CategoryDummy(
//       catPic: Assets.agricultureIcon,
//       catName: "Agriculture",
//       backgroundColor: 0xFFE5F2E6),
//   CategoryDummy(
//       catPic: Assets.informationTech,
//       catName: "Travel",
//       backgroundColor: 0xFFFEF3E8),
//   CategoryDummy(
//       catPic: Assets.automotiveBoatIcon,
//       catName: "Automotive\n& Boat",
//       backgroundColor: 0xFFEDEDF5),
//   CategoryDummy(
//       catPic: Assets.healthCareAndFitnessIcon,
//       catName: "Health Care & Fitness",
//       backgroundColor: 0xFFEBF8F7),
//   CategoryDummy(
//       catPic: Assets.transportationIcon,
//       catName: "Transportation\n& Storage",
//       backgroundColor: 0xFFF2EBE5),
//   CategoryDummy(
//       catPic: Assets.manufactureIcon,
//       catName: "Manufacturing",
//       backgroundColor: 0xFFF3F9EC),
//   CategoryDummy(
//       catPic: Assets.petServiceIcon,
//       catName: "Pet Services",
//       backgroundColor: 0xFFE8F5FC),
//   CategoryDummy(
//       catPic: Assets.wholeSaleDistributorIcon,
//       catName: "Whole Sale & Distributor",
//       backgroundColor: 0xFFE6F6F6),
// ];

List<BusinessModel> businessProducts = [
  BusinessModel(
      images: [Assets.dummyImage],
      name: 'Drop shipping website & E-commerce business',
      salePrice: 40,
      address: "San Francisco, USA"),
  BusinessModel(
      images: [Assets.dummyImage],
      name: 'Drop shipping website & E-commerce business',
      salePrice: 40,
      address: "San Francisco, USA"),
  BusinessModel(
      images: [Assets.dummyImage],
      name: 'Drop shipping website & E-commerce business',
      salePrice: 40,
      address: "San Francisco, USA"),
  BusinessModel(
      images: [Assets.dummyImage],
      name: 'Drop shipping website & E-commerce business',
      salePrice: 40,
      address: "San Francisco, USA"),
];
List<BusinessProductModel> businessProducts1 = [
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      businessName: 'Drop shipping website & E-commerce business',
      isFav: false,
      price: 'USD 40K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 30K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 20K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: false,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 10K',
      location: "San Francisco, USA"),
];

///to be continued
List<BusinessBrokerProfile> profileData = [
  BusinessBrokerProfile(
      name: "Gabriel Tasse",
      image: Assets.dummyImage3,
      businessCategories: ["Business", "Franchises"],
      rating: 5),
  BusinessBrokerProfile(
      name: "Gabriel Tasse",
      image: Assets.dummyImage3,
      businessCategories: [
        "Business",
        "Franchises",
        "Businesss plus",
        "testting"
      ],
      rating: 5),
];

List<BusinessProductModel> businessProductsForYou = [
  BusinessProductModel(
      businessImage: Assets.dummyImage4,
      businessName: 'Famous tutoring franchise',
      isFav: false,
      price: 'USD 40K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 30K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 20K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: false,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 10K',
      location: "San Francisco, USA"),
];
List<BusinessProductModel> businessProductsOnline = [
  BusinessProductModel(
      businessImage: Assets.dummyImage5,
      businessName: 'Web design & Digital marketing company',
      isFav: false,
      price: 'USD 40K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 30K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 20K',
      location: "San Francisco, USA"),
  BusinessProductModel(
      businessImage: Assets.dummyImage2,
      isFav: false,
      businessName: 'Drop shipping website & E-commerce business',
      price: 'USD 10K',
      location: "San Francisco, USA"),
];

List<BusinessModel>? allData;
List<BusinessModel>? searchData;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
// get the user data for accessing in app
    AppInitializer.init();
    context.read<AllBusinessCubit>().getBusiness();
    context.read<RecentlyAddedCubit>().getRecentBusiness();
    context.read<CategoryCubit>().getCategory();
    context.read<RecentlyViewedCubit>().getRecentBusiness();
    context.read<OnlineBusinessCubit>().getBusiness();
    context.read<BrokersCubit>().getBrokers();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("User token here ${Data.app.user!.token}");

    return Scaffold(
      body: Column(
        children: [

          ///Upper Container with Search Bar
          SizedBox(
            height: 200.h,
            // color: Colors.red,
            child: Stack(
              children: [
                Container(
                  // width: 428,
                  height: 165.h,
                  decoration:
                  const BoxDecoration(color: AppColors.primaryColor),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 24.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(AppStrings.hello,
                                style: Styles.circularStdRegular(context,
                                    fontSize: 14, color: AppColors.whiteColor)),
                            AppText("Adib Javid",
                                style: Styles.circularStdMedium(context,
                                    fontSize: 20, color: AppColors.whiteColor))
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigate.to(context, Notifications());
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 23.sp),
                            child: SvgPicture.asset(Assets.notificationIcon)),
                      )
                    ],
                  ),
                ),
                Positioned(
                  //top: 0,
                    left: 24,
                    right: 24,
                    bottom: 0,
                    child: CustomTextFieldWithOnTap(
                      readOnly: true,
                      controller: searchController,
                      borderRadius: 40,
                      isBorderRequired: false,
                      isShadowRequired: true,
                      onTap: () {
                        Navigate.to(
                            context,
                            BusniessSearch(
                              model: businessProducts,
                            ));
                      },
                      prefixIcon: SvgPicture.asset(Assets.searchIcon),
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: GeneralizedDropDown(
                          items: countryList,
                          selectedValue: countryList[0],
                          onChanged: (v) {},
                        ),
                      ),
                      hintText: 'Search for business',
                      textInputType: TextInputType.text,
                    ))
              ],
            ),
          ),

          ///
          10.y,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///Category
                      5.y,
                      AppText("Categories",
                          style:
                          Styles.circularStdMedium(context, fontSize: 18)),
                      10.y,
                      BlocConsumer<CategoryCubit, CategoryState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return state is CategoryLoaded
                              ? CategoryList(
                            categoryData: state.model,
                            getData: (Category val, int index) {
                              if (index == 7) {
                                Navigate.to(
                                    context,
                                    AllCategory(
                                      categoryData: state.model,
                                    ));
                              } else {
                                Navigate.to(context,
                                    SearchListing(title: val.title!));
                              }
                            },
                          )
                              : state is CategoryLoading
                              ? const CategoryLoadingShimmer()
                              : const SizedBox();
                        },
                      )

                      ///recently view
                      ///
                      ,
                      10.y,
                      AppText("Recently View",
                          style:
                          Styles.circularStdMedium(context, fontSize: 18)),
                      5.y,
                      BlocConsumer<RecentlyViewedCubit, RecentlyViewedState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return state is RecentlyViewedLoaded
                              ? RecentlyViewWidget(
                              businessProducts: state.business,
                              getData: (dto) {
                                Navigate.to(
                                    context, const BusinessDetails());
                              })
                              : state is RecentlyViewedLoading
                              ? const RecentViewedBusinessLoading()
                              : state is RecentlyViewedError
                              ? Center(
                            child: AppText(
                              state.error!,
                              style: Styles.circularStdRegular(
                                  context),
                            ),
                          )
                              : const SizedBox.shrink();
                        },
                      ),

                      ///Recently Added
                      19.y,
                      Row(
                        children: [
                          AppText("Recently Added",
                              style: Styles.circularStdMedium(context,
                                  fontSize: 18)),
                          const Spacer(),
                          AppText("View all",
                              style: Styles.circularStdRegular(context,
                                  fontSize: 14))
                        ],
                      ),
                      5.y,
                      BlocConsumer<RecentlyAddedCubit, RecentlyAddedState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return state is RecentlyAddedLoading
                              ? const BusinessLoading()
                              : state is RecentlyAddedLoaded
                              ? RecentlyAdded(
                            businessProducts: state.data,
                            getData: (v) {
                              Navigate.to(
                                  context, const BusinessDetails());
                            },
                            chatTap: (BusinessModel val) {
                              BottomNotifier.bottomPageController!
                                  .jumpToPage(2);
                              BottomNotifier
                                  .bottomNavigationNotifier.value = 2;
                            },
                          )
                              : state is RecentlyAddedError
                              ? AppText(
                            state.error!,
                            style: Styles.circularStdRegular(
                                context),
                          )
                              : const SizedBox.shrink();
                        },
                      ),

                      ///  Business Broker
                      19.y,
                      Row(
                        children: [
                          AppText("Business Broker",
                              style: Styles.circularStdMedium(context,
                                  fontSize: 18)),
                          const Spacer(),
                          AppText("View all",
                              style: Styles.circularStdRegular(context,
                                  fontSize: 14))
                        ],
                      ),
                      5.y,
                      SizedBox(
                        height: 257.h,
                        //width: 1.sw,
                        child: ListView(
                          //mainAxisSize: MainAxisSize.min,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          // shrinkWrap: true,
                          children: [
                            Container(
                              width: 181.w,
                              height: 257,
                              decoration: ShapeDecoration(
                                color: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, bottom: 0, top: 30),
                                    child: AppText(
                                      "Share\nYour\nExpertise",
                                      style: Styles.circularStdRegular(
                                        context,
                                        color: AppColors.whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.4,
                                      ),
                                      maxLine: 6,
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                    child: CustomButton(
                                      onTap: () {},
                                      text: 'Create Your Profile',
                                      textFontWeight: FontWeight.w400,
                                      horizontalMargin: 10,
                                      height: 45.sp,
                                      verticalMargin: 10,
                                      // verticalPadding: 13,
                                      textSize: 12,
                                      bgColor: AppColors.whiteColor,
                                      textColor: AppColors.primaryColor,
                                      borderRadius: 30.sp,
                                    ),
                                  ),
                                  10.y
                                ],
                              ),
                            ),
                            10.x,
                            BlocConsumer<BrokersCubit, BrokersState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                return state is BrokersLaoding
                                    ? const BrokerLoading()
                                    : state is BrokersLoaded
                                    ? BusinessProfileWidget(
                                  profileData: state.brokers,
                                  getData: (BrokersListModel val) {
                                    //print(val.rating);
                                    Navigate.to(
                                        context,
                                        BrokerProfile(
                                          model: val,
                                        ));
                                  },
                                )
                                    : state is BrokersError
                                    ? Center(
                                    child: AppText(
                                      state.error!,
                                      style:
                                      Styles.circularStdRegular(
                                          context),
                                    ))
                                    : const SizedBox.shrink();
                              },
                            )
                          ],
                        ),
                      ),

                      /// Business For  You
                      19.y,
                      Row(
                        children: [
                          AppText("Business For You",
                              style: Styles.circularStdMedium(context,
                                  fontSize: 18)),
                          const Spacer(),
                          AppText("View all",
                              style: Styles.circularStdRegular(context,
                                  fontSize: 14))
                        ],
                      ),
                      5.y,
                      BlocConsumer<AllBusinessCubit, AllBusinessState>(
                        listener: (context, state) {
                          if (state is AllBusinessLoaded) {
                            allData = state.business;
                            searchData = state.business;
                          }
                          if (state is AllBusinessError) {
                            WidgetFunctions.instance.snackBar(context,
                                text: state.error,
                                bgColor: AppColors.primaryColor,
                                textStyle: Styles.circularStdRegular(context,
                                    color: AppColors.whiteColor));
                          }
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return state is AllBusinessLoading
                              ? const BusinessLoading()
                              : state is AllBusinessLoaded
                              ? BusinessForYouWidget(
                            businessProducts: state.business!,
                            getData: (data) {
                              Navigate.to(
                                  context, BusinessDetails(model: data,));
                            },
                            chatTap: (BusinessModel val) {
                              BottomNotifier.bottomPageController!
                                  .jumpToPage(2);
                              BottomNotifier
                                  .bottomNavigationNotifier.value = 2;
                            },
                          )
                              : state is AllBusinessError
                              ? Center(
                            child: AppText(state.error!,
                                style: Styles.circularStdMedium(
                                    context)),
                          )
                              : const SizedBox.shrink();
                        },
                      )

                      /// online Business
                      ,
                      19.y,
                      Row(
                        children: [
                          AppText("Online Business",
                              style: Styles.circularStdMedium(context,
                                  fontSize: 18)),
                          const Spacer(),
                          AppText("View all",
                              style: Styles.circularStdRegular(context,
                                  fontSize: 14))
                        ],
                      ),
                      5.y,
                      BlocConsumer<OnlineBusinessCubit, OnlineBusinessState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return state is OnlineBusinessLoaded
                              ? BusinessForYouWidget(
                            businessProducts: state.data,
                            getData: (data) {
                              Navigate.to(
                                  context, const BusinessDetails());
                            },
                            chatTap: (BusinessModel val) {
                              BottomNotifier.bottomPageController!
                                  .jumpToPage(2);
                              BottomNotifier
                                  .bottomNavigationNotifier.value = 2;
                            },
                          )
                              : state is OnlineBusinessLoading
                              ? const BusinessLoading()
                              : state is OnlineBusinessError
                              ? Center(
                            child: AppText(
                              state.error!,
                              style: Styles.circularStdRegular(
                                  context),
                            ),
                          )
                              : const SizedBox();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
