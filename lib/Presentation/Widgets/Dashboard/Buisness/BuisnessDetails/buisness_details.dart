import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
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
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<AllBusinessCubit>().getBusiness(id: widget.id);
    context.read<AddToRecentlyViewCubit>().addToRecentlyViewed(widget.id!);
    context
        .read<BussinessWishlistApiCubit>()
        .checkBusinessInWishList(widget.id!);

    super.initState();
  }

  bool wishlistbool = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AllBusinessCubit, AllBusinessState>(
          listener: (BuildContext context, state) {
            if (state is AllBusinessLoading) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is AllBusinessError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                WidgetFunctions.instance.snackBar(context,
                    text: state.error,
                    bgColor: AppColors.primaryColor,
                    textStyle: Styles.circularStdRegular(context,
                        color: AppColors.whiteColor));
              });
            }

            if (state is AllBusinessLoaded) {
              Navigator.pop(context);
              model = state.business![0];
            }
          },
          builder: (context, state) {
            return state is AllBusinessLoaded
                ? NestedScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          elevation: 0,
                          stretch: true,
                          pinned: true,
                          automaticallyImplyLeading: false,
                          flexibleSpace: Stack(
                            children: [
                              CachedImage(
                                  height: 330.sp,
                                  width: 1.sw,
                                  isCircle: false,
                                  url:
                                      "${ApiConstant.baseUrl}${state.business![0].images?.first}"),
                              Row(
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
                                  BlocConsumer<BussinessWishlistApiCubit,
                                      BussinessWishlistApiState>(
                                    listener: (context, state) {
                                      if (state
                                          is BussinessWishlistApiInLoaded) {
                                        context
                                            .read<BussinessWishlistApiCubit>()
                                            .checkBusinessInWishList(
                                                widget.id ?? "");
                                      }

                                      // TODO: implement listener
                                    },
                                    builder: (context, state) {
                                      return state is BussinessWishlistApiLoaded
                                          ? IconButton(
                                              icon: state.wishliatValue!
                                                  ? SvgPicture.asset(
                                                      Assets.heartRed)
                                                  : SvgPicture.asset(
                                                      Assets.heartLight),
                                              onPressed: () async {
                                                context
                                                    .read<
                                                        BussinessWishlistApiCubit>()
                                                    .addBusinessInWishList(
                                                        widget.id!,
                                                        state.wishliatValue!);
                                              },
                                            )
                                          : IconButton(
                                              icon: SvgPicture.asset(
                                                  Assets.heartLight),
                                              onPressed: () async {
                                                context
                                                    .read<
                                                        BussinessWishlistApiCubit>()
                                                    .addBusinessInWishList(
                                                        widget.id!, true);
                                              },
                                            );
                                    },
                                  ),
                                  10.x,
                                ],
                              )
                            ],
                          ),
                          backgroundColor: AppColors.whiteColor,
                          expandedHeight: 1.sh * 0.26,
                        ),
                      ];
                    },
                    body: Builder(builder: (context) {
                      BusinessModel value = state.business![0];

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
                                        "${value.city}, ${value.country}",
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
                                                  ? value.industry!['title'] ??
                                                      ''
                                                  : '',
                                              style: Styles.circularStdRegular(
                                                  context,
                                                  fontSize: 14.sp))),
                                    ],
                                  ),
                                  5.y,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          child: AppText(
                                              value.numberOfEmployes!,
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
                                    labelText: "20hr per week",
                                    height: 60.sp,
                                    style: Styles.circularStdRegular(context,
                                        color: AppColors.whiteColor),
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
                                            style: Styles.circularStdRegular(
                                              context,
                                              color: AppColors.whiteColor,
                                            ),
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
                                                  style:
                                                      Styles.circularStdMedium(
                                                          context,
                                                          fontSize: 16.sp)),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                            onTap: () async {
                                              await DownloadFile.download(
                                                  model!.attachedFiles![0]);
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
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: CustomButton(
                                onTap: () async {
                                  //              BottomNotifier.bottomNavigationNotifier.value=2;
                                  //
                                  // Navigate.toReplace(context, const BottomNavigationScreen(initialPage: 2,));

                                  Navigate.to(
                                      context,
                                      ChatScreen(
                                        backButton: true,
                                      ));
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
                          ],
                        ),
                      );
                    }),
                  )
                : state is AllBusinessError
                    ? AppText(state.error!,
                        style: Styles.circularStdRegular(context))
                    : 10.x;
          },
        ),
      ),
    );
  }
}

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
