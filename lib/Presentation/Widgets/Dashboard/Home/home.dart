import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/AppData/app_initializer.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/firebase_services.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisness_profile.dart';
import 'package:buysellbiz/Domain/Category/categroy.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/broker_loading.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/business_shimmer.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/category_loading.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/recently_viewd_bussines_loading.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BottomNavigation/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BrokerProfile/broker_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/ViewAllBusiness/view_all_business.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Category/all_categories.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_navigation.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/BusinessBroker/Profile/business_profile_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/BusinessBroker/view_all_brokers.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/Category/categories_list.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/for_you_buisiness.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/recently_added.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/recently_view.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Brokers/brokers_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/OnlineBusiness/online_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/RecentlyView/recently_viewed_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/notifications.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/export_profile.dart';
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

///to search data from list and assign to list
List<BusinessModel>? allBusiness;
List<BusinessModel>? allBusinessSearch;

List<BusinessModel>? recentlyAdded;
List<BusinessModel>? recentlyAddedSearch;

List<BusinessModel>? recentlyViewed;
List<BusinessModel>? recentlyViewedSearch;

List<BusinessModel>? onlineBusiness;
List<BusinessModel>? onlineBusinessSearch;

List<BrokersListModel>? brokers;

class _HomeScreenState extends State<HomeScreen> {
  getFcm() async {
    await FirebaseServices.getFcm();
  }

  @override
  void initState() {
    searchController.clear();
    getFcm();

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
  void dispose() {
    // TODO: implement dispose
    // InboxRepo.socket.disconnect();
    //InboxRepo.socket.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String fullName = Data.app.user?.user?.fullName ?? '';

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
                            AppText(fullName,
                                style: Styles.circularStdMedium(context,
                                    fontSize: 20, color: AppColors.whiteColor))
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigate.to(context, const Notifications());
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
                      readOnly: false,
                      controller: searchController,
                      borderRadius: 40,
                      isBorderRequired: false,
                      isShadowRequired: true,
                      onChanged: (value) {
                        _search(value);
                      },
                      prefixIcon: SvgPicture.asset(Assets.searchIcon),
                      // suffixIcon: Container(
                      //   margin: const EdgeInsets.only(right: 5),
                      //   child: GeneralizedDropDown(
                      //     items: countryList,
                      //     selectedValue: countryList[0],
                      //     onChanged: (v) {
                      //       _searchByCountry(v);
                      //       print(v);
                      //     },
                      //   ),
                      // ),
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
                                      Navigate.to(
                                          context,
                                          SearchListing(
                                              title: val.title!, id: val.id!));
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
                        listener: (context, state) {
                          if (state is RecentlyViewedLoaded) {
                            recentlyViewedSearch = state.business;
                            recentlyViewed = state.business;
                          }
                        },
                        builder: (context, state) {
                          return state is RecentlyViewedLoaded
                              ? RecentlyViewWidget(
                                  businessProducts: recentlyViewedSearch,
                                  getData: (dto) {
                                    Navigate.to(
                                        context,
                                        BusinessDetails(
                                          modelData: dto,
                                          id: dto.id,
                                        ));
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
                          _viewAllBusiness(
                              data: recentlyAdded,
                              businessType: 'Recently Added'),
                        ],
                      ),
                      5.y,
                      BlocConsumer<RecentlyAddedCubit, RecentlyAddedState>(
                        listener: (context, state) {
                          if (state is RecentlyAddedLoaded) {
                            recentlyAddedSearch = state.data;
                            recentlyAdded = state.data;
                          }
                        },
                        builder: (context, state) {
                          return state is RecentlyAddedLoading
                              ? BusinessLoading(
                                  direction: Axis.horizontal,
                                )
                              : state is RecentlyAddedLoaded
                                  ? RecentlyAdded(
                                      businessProducts: recentlyAddedSearch,
                                      getData: (v) {
                                        Navigate.to(
                                            context,
                                            BusinessDetails(
                                              modelData: v,
                                              id: v.id,
                                            ));
                                      },
                                      chatTap: (BusinessModel val) {
                                        ChatNavigation.getToChatDetails(context,
                                            val.createdBy!.id!, val.id!);
                                        // BottomNotifier.bottomPageController!
                                        //     .jumpToPage(2);
                                        // BottomNotifier
                                        //     .bottomNavigationNotifier.value = 2;
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
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ViewAllBrokers(
                                    profileData: brokers,
                                    getData: (val) {},
                                  );
                                },
                              ));
                            },
                            child: AppText("View all",
                                style: Styles.circularStdRegular(context,
                                    fontSize: 14)),
                          )
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
                                      onTap: () {
                                        Navigate.to(
                                            context, const ExportProfile());
                                      },
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
                                if (state is BrokersLoaded) {
                                  brokers = state.brokers;
                                }
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
                                                    id: val.id,
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
                          _viewAllBusiness(
                              data: allBusiness,
                              businessType: 'Business For You'),
                        ],
                      ),
                      5.y,
                      BlocConsumer<AllBusinessCubit, AllBusinessState>(
                        listener: (context, state) {
                          if (state is AllBusinessLoaded) {
                            allBusiness = state.business;
                            allBusinessSearch = state.business;
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
                              ? BusinessLoading(
                                  direction: Axis.horizontal,
                                )
                              : state is AllBusinessLoaded
                                  ? BusinessForYouWidget(
                                      businessProducts: allBusinessSearch,
                                      getData: (data) {
                                        Navigate.to(
                                            context,
                                            BusinessDetails(
                                              modelData: data,
                                              id: data.id,
                                            ));
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
                          _viewAllBusiness(
                              data: onlineBusiness,
                              businessType: 'Online Business'),
                        ],
                      ),
                      5.y,
                      BlocConsumer<OnlineBusinessCubit, OnlineBusinessState>(
                        listener: (context, state) {
                          if (state is OnlineBusinessLoaded) {
                            onlineBusiness = state.data;
                            onlineBusinessSearch = state.data;
                          }
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return state is OnlineBusinessLoaded
                              ? BusinessForYouWidget(
                                  businessProducts: onlineBusinessSearch,
                                  getData: (data) {
                                    Navigate.to(
                                        context,
                                        BusinessDetails(
                                          modelData: data,
                                          id: data.id,
                                        ));
                                  },
                                  chatTap: (BusinessModel val) {
                                    BottomNotifier.bottomPageController!
                                        .jumpToPage(2);
                                    BottomNotifier
                                        .bottomNavigationNotifier.value = 2;
                                  },
                                )
                              : state is OnlineBusinessLoading
                                  ? BusinessLoading(
                                      direction: Axis.horizontal,
                                    )
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

  _search(String query) {
    query = query.toLowerCase();
    if (query.isNotEmpty) {
      allBusinessSearch = allBusinessSearch!
          .where((item) => item.name!.toLowerCase().contains(query))
          .toList();
      onlineBusinessSearch = onlineBusinessSearch!
          .where((item) => item.name!.toLowerCase().contains(query))
          .toList();
      recentlyViewedSearch = recentlyViewedSearch!
          .where((item) => item.name!.toLowerCase().contains(query))
          .toList();
      recentlyAddedSearch = recentlyAddedSearch!
          .where((item) => item.name!.toLowerCase().contains(query))
          .toList();
    } else {
      allBusinessSearch = allBusiness;
      onlineBusinessSearch = onlineBusiness;
      recentlyViewedSearch = recentlyAdded;
      recentlyAddedSearch = recentlyViewed;
    }
    setState(() {});
  }

  _viewAllBusiness({List<BusinessModel>? data, String? businessType}) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ViewAllBusiness(
              model: data,
              businessRow: businessType,
            );
          },
        ));
      },
      child: AppText("View all",
          style: Styles.circularStdRegular(context, fontSize: 14)),
    );
  }

// _searchByCountry(String query) {
//   query = query;
//   print(query);
//   setState(() {
//     allBusinessSearch =
//         allBusiness!.where((item) => item.country == query).toList();
//     onlineBusinessSearch =
//         onlineBusiness!.where((item) => item.country == query).toList();
//     recentlyViewedSearch =
//         recentlyAdded!.where((item) => item.country == query).toList();
//     recentlyAddedSearch =
//         recentlyViewed!.where((item) => item.country == query).toList();
//   });
// }
}
