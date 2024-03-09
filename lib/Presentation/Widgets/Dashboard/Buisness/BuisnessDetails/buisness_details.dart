import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/business_shimmer.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Components/chart_revenue.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/add_to_recently_view_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/bussiness_wishlist_api_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/download_file.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/State/business_wishlistapi_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_navigation.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/chat.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Saved/Controller/saved_listing_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails(
      {super.key, this.modelData, this.id, this.isFromNotification});

  final BusinessModel? modelData;
  final String? id;
  final bool? isFromNotification;

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  BusinessModel? model;

  @override
  void initState() {
    context.read<AllBusinessCubit>().getByIdBusiness(id: widget.id);
    context.read<AddToRecentlyViewCubit>().addToRecentlyViewed(widget.id!);
    context
        .read<BussinessWishlistApiCubit>()
        .checkBusinessInWishList(widget.id!);

    super.initState();
  }

  bool wishlistbool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AllBusinessCubit, AllBusinessState>(
        listener: (BuildContext context, state) {
          if (state is AllBusinessLoading) {
            LoadingDialog.showLoadingDialog(context);
          }

          if (state is AllBusinessError) {
            Navigator.of(context).pop(true);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              WidgetFunctions.instance.snackBar(context,
                  text: state.error,
                  bgColor: AppColors.primaryColor,
                  textStyle: Styles.circularStdRegular(context,
                      color: AppColors.whiteColor));
            });
          }

          if (state is BusinessByIdLoaded) {
            print(state.business!.toJson());
            Navigator.pop(context);
            model = state.business;
          }
        },
        builder: (context, state) {
          return state is BusinessByIdLoaded
              ? NestedScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                          pinned: true,
                          surfaceTintColor: AppColors.whiteColor,
                          stretch: true,
                          leadingWidth: MediaQuery.sizeOf(context).width,
                          leading: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 10.sp),
                                  height: 33.sp,
                                  width: 33.sp,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                  )),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigate.pop(context);
                              //   },
                              //   child: SvgPicture.asset(
                              //     Assets.arrowBackIcon,
                              //     width: 20.sp,
                              //     height: 30.sp,
                              //     fit: BoxFit.fitWidth,
                              //   ),
                              // ),
                              const Spacer(),
                              Container(
                                height: 30.sp,
                                width: 30.sp,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                    onTap: () async {
                                      const url =
                                          'https://wa.me/?text=Check out my awesome Flutter app!';
                                      final encoded = Uri.encodeFull(url);
                                      await Share.share(encoded);
                                    },
                                    child: const Icon(Icons.share)),
                              ),
                              3.x,
                              BlocConsumer<BussinessWishlistApiCubit,
                                  BussinessWishlistApiState>(
                                listener: (context, state) {
                                  if (state is BussinessWishlistApiInLoaded) {
                                    context
                                        .read<BussinessWishlistApiCubit>()
                                        .checkBusinessInWishList(
                                            widget.id ?? "");
                                    context
                                        .read<SavedListingCubit>()
                                        .getWishlistData();
                                  }

                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  return state is BussinessWishlistApiLoaded
                                      ? Container(
                                          height: 30.sp,
                                          width: 30.sp,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: state.wishliatValue!
                                                  ? SvgPicture.asset(
                                                      Assets.heartRed,
                                                    )
                                                  : SvgPicture.asset(
                                                      Assets.heartLight,
                                                    ),
                                              onPressed: () async {
                                                context
                                                    .read<
                                                        BussinessWishlistApiCubit>()
                                                    .addBusinessInWishList(
                                                        widget.id!,
                                                        state.wishliatValue!);
                                              },
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 30.sp,
                                          width: 30.sp,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            icon: SvgPicture.asset(
                                                Assets.heartLight),
                                            onPressed: () async {
                                              context
                                                  .read<
                                                      BussinessWishlistApiCubit>()
                                                  .addBusinessInWishList(
                                                      widget.id!, true);
                                            },
                                          ),
                                        );
                                },
                              ),
                              10.x,
                            ],
                          ),
                          // collapsedHeight: 0,
                          expandedHeight:
                              MediaQuery.of(context).size.height * 0.28,
                          automaticallyImplyLeading: false,
                          backgroundColor: AppColors.whiteColor,
                          flexibleSpace: FlexibleSpaceBar(
                            background: CachedImage(
                              isCircle: false,
                              url:
                                  "${ApiConstant.baseurl}/${model?.images!.first}",
                              height: 200.h,
                              width: 1.sw,
                              fit: BoxFit.cover,
                            ),
                          )
                          // backgroundColor: AppColors.whiteColor,
                          // expandedHeight: 1.sh * 0.26,
                          ),
                    ];
                  },
                  body: Builder(builder: (context) {
                    BusinessModel? value = state.business;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.y,
                                Row(
                                  children: [
                                    //24.x,
                                    AppText(
                                      "${value!.city}, ${value.country}",
                                      style: Styles.circularStdRegular(
                                        context,
                                        color: AppColors.lightGreyColor,
                                        fontSize: 12,
                                      ),
                                    ),

                                    const Spacer(),
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 19,
                                    ),
                                    AppText('View',
                                        style: Styles.circularStdRegular(
                                            context,
                                            color: AppColors.lightGreyColor,
                                            fontSize: 12)),
                                    5.x,
                                    AppText(value.viewsCount!,
                                        style: Styles.circularStdRegular(
                                            context,
                                            color: AppColors.lightGreyColor,
                                            fontSize: 12)),
                                    10.x
                                  ],
                                ),
                                5.y,
                                AppText(
                                  value.name!,
                                  style: Styles.circularStdMedium(context,
                                      fontSize: 22),
                                  maxLine: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                10.y,
                                AppText("\$ ${value.salePrice!} USD",
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 16.sp,
                                        color: AppColors.primaryColor)),
                                10.y,
                                AppText(
                                  value.businessDescription!,
                                  style: Styles.circularStdRegular(context,
                                      fontSize: 12,
                                      color: AppColors.lightGreyColor),
                                  maxLine: 8,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                15.y,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                        child: AppText("Industry",
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 16.sp))),
                                    //const Spacer(),
                                    Expanded(
                                        child: AppText(
                                            value.industry != null
                                                ? value.industry!['title'] ?? ''
                                                : '',
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 14.sp))),
                                  ],
                                ),
                                5.y,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: AppText("Year found",
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 16.sp))),
                                    // const Spacer(),
                                    Expanded(
                                        child: AppText(value.foundationYear!,
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 16.sp))),
                                    //const Spacer()
                                  ],
                                ),
                                5.y,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: AppText("# of owner",
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 16.sp))),
                                    Expanded(
                                        child: AppText(value.numberOfOwners!,
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 16.sp))),
                                  ],
                                ),
                                5.y,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: AppText("# of employees",
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 16.sp))),
                                    //  const Spacer(),
                                    Expanded(
                                        child: AppText(value.numberOfEmployes!,
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 16.sp))),
                                  ],
                                ),
                                10.y,
                                AppText('Business hour',
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 20)),
                                ChipWidget(
                                  labelText: "${value.businessHour} hours",
                                  height: 60.sp,
                                ),
                                10.y,
                                AppText('Advantages',
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 20)),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Row(
                                    children: [
                                      for (String advantage
                                          in value.advantages ?? [])
                                        ChipWidget(
                                          labelText: advantage,
                                          height: 60.sp,
                                        ),
                                    ],
                                  ),
                                ),
                                10.y,
                                AppText('Documents',
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 20)),
                                10.y,
                                if (value.attachedFiles != null &&
                                    value.attachedFiles!.isNotEmpty)
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.pdfIcon,
                                        width: 40,
                                        height: 50,
                                      ),
                                      10.x,
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                                value.attachedFiles!.last
                                                    .split('/')
                                                    .last,
                                                maxLine: 2,
                                                style: Styles.circularStdMedium(
                                                    context,
                                                    fontSize: 16.sp)),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                          onTap: () async {
                                            await DownloadFile.download(
                                                model!.attachedFiles![0],
                                                context);
                                          },
                                          child: SvgPicture.asset(
                                              Assets.downloadIcon))
                                    ],
                                  ),
                                14.y,
                                AppText('Revenue history',
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 20)),
                                10.y,
                                FractionallySizedBox(
                                  widthFactor: 1.07,
                                  child: VerticalBarChart(
                                    business: value,
                                  ),
                                ),
                                60.y,
                              ],
                            ),
                          ),
                          value.createdBy?.id != Data.app.user?.user?.id
                              ? Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: CustomButton(
                                    onTap: () async {
                                      //              BottomNotifier.bottomNavigationNotifier.value=2;
                                      //
                                      // Navigate.toReplace(context, const BottomNavigationScreen(initialPage: 2,));

                                      print(value.createdBy?.toJson());
                                      if (value.createdBy != null) {
                                        ChatNavigation.getToChatDetails(context,
                                            value.createdBy!.id!, value.id!);
                                      }
                                    },
                                    leadingIcon: Assets.messageWhiteIcon,
                                    leadingSvgIcon: true,
                                    imageWidth: 18.sp,
                                    textFontWeight: FontWeight.w500,
                                    borderRadius: 30,
                                    height: 56,
                                    width: 1.sw / 1.25,
                                    text: 'Chat',
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  }),
                )
              : state is AllBusinessError
                  ? Center(
                      child: AppText(state.error!,
                          style: Styles.circularStdRegular(context)),
                    )
                  : 10.x;
        },
      ),
    );
  }
}

// class ChipWidget extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final String? labelText;
//   final Color? chipColor;
//   final TextStyle? style;
//
//   const ChipWidget({
//     super.key,
//     this.height,
//     this.width,
//     this.labelText,
//     this.chipColor,
//     this.style,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height ?? 30.sp,
//       width: width,
//       child: Chip(
//         backgroundColor: AppColors.lightBlueColor,
//         label: AppText(
//           labelText ?? 'Chat',
//           style: style ??
//               Styles.circularStdRegular(context, color: AppColors.blackColor),
//         ),
//       ),
//     );
//   }
// }

class WishListDetail extends StatelessWidget {
  const WishListDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1.sh * 0.36,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.dummyImage4), fit: BoxFit.fill)),
          child: Container(
            margin: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigate.pop(context);
                  },
                  child: SvgPicture.asset(
                    Assets.arrowBackIcon,
                    width: 20.sp,
                    height: 30.sp,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.share),
                3.x,
                SvgPicture.asset(Assets.heartLight),
                10.x
              ],
            ),
          ),
        )
      ],
    );
  }
}
