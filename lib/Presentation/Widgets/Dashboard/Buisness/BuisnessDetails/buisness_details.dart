import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/business_shimmer.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Components/chart_revenue.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/bussiness_wishlist_api_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/State/business_detail_state.dart';

import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key, this.model});

  final BusinessModel? model;

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  @override
  void initState() {
    context
        .read<BussinessWishlistApiCubit>()
        .bussinessWishlistApi(widget.model!.id.toString());
    super.initState();
  }

  bool? wishlistbool;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            print(widget.model!.id);

            return [
              SliverAppBar(
                elevation: 0,
                stretch: true,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: BlocConsumer<BussinessWishlistApiCubit,
                        BussinessWishlistApiState>(
                      listener: (BuildContext context, state) {
                        if (state is BussinessWishlistApiError) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            WidgetFunctions.instance.snackBar(context,
                                text: state.error,
                                bgColor: AppColors.primaryColor,
                                textStyle: Styles.circularStdRegular(context,
                                    color: AppColors.whiteColor));
                          });
                        }

                        if (state is BussinessWishlistApiLoaded) {
                          wishlistbool = state.wishliatValue;
                        }
                      },
                      builder: (context, state) {
                        print(state);
                        if (state is BussinessWishlistApiLoading) {
                          return const BusinessLoading();
                        } else {
                          return Column(
                            children: [
                              Container(
                                height: 1.sh * 0.36,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Assets.dummyImage4),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigate.pop(context);
                                        },
                                        child: Container(
                                          child: SvgPicture.asset(
                                            Assets.arrowBackIcon,
                                            width: 20.sp,
                                            height: 30.sp,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.share),
                                      3.x,
                                      wishlistbool!
                                          ? SvgPicture.asset(Assets.heartLight)
                                          : SvgPicture.asset(Assets.heartRed),
                                      10.x,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    )),
                backgroundColor: AppColors.whiteColor,
                expandedHeight: 1.sh * 0.36,
              ),
            ];
          },
          body: Builder(builder: (context) {
            final value = widget.model!;
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
                            AppText(value.city.toString(),
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.lightGreyColor,
                                    fontSize: 12)),

                            const Spacer(),
                            const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 19,
                            ),
                            AppText('View',
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.lightGreyColor,
                                    fontSize: 12)),
                            5.x,
                            AppText('321',
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.lightGreyColor,
                                    fontSize: 12)),
                            10.x
                          ],
                        ),
                        5.y,
                        AppText(
                          "Drop shipping website & E-commerce business",
                          style:
                              Styles.circularStdMedium(context, fontSize: 22),
                          maxLine: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        10.y,
                        AppText("\$40k USD",
                            style: Styles.circularStdMedium(context,
                                fontSize: 16.sp,
                                color: AppColors.primaryColor)),
                        10.y,
                        AppText(
                          "Are you looking to start your own e-commerce venture without the hassle of managing inventory? Consider buying a drop shipping website and e-commerce business. With this turnkey solution, you can leverage existing supplier relationships and a ready-made online storefront to jumpstart your online sales. It's an efficient way to enter the world of e-commerce and start selling products to a global audience.",
                          style: Styles.circularStdRegular(context,
                              fontSize: 12, color: AppColors.lightGreyColor),
                          maxLine: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                        15.y,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: AppText("Industry",
                                    style: Styles.circularStdRegular(context,
                                        fontSize: 16.sp))),
                            //const Spacer(),
                            Expanded(
                                child: AppText("Amazon Drop Shipping",
                                    style: Styles.circularStdRegular(context,
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
                                    style: Styles.circularStdRegular(context,
                                        fontSize: 16.sp))),
                            // const Spacer(),
                            Expanded(
                                child: AppText("2009",
                                    style: Styles.circularStdRegular(context,
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
                                    style: Styles.circularStdRegular(context,
                                        fontSize: 16.sp))),
                            Expanded(
                                child: AppText("2",
                                    style: Styles.circularStdRegular(context,
                                        fontSize: 16.sp))),
                          ],
                        ),
                        5.y,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: AppText("# of employees",
                                    style: Styles.circularStdRegular(context,
                                        fontSize: 16.sp))),
                            //  const Spacer(),
                            Expanded(
                                child: AppText("19",
                                    style: Styles.circularStdRegular(context,
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
                              ChipWidget(
                                labelText: "Building property",
                                height: 60.sp,
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.whiteColor),
                              ),
                              5.x,
                              ChipWidget(
                                labelText: "Equipment",
                                height: 60.sp,
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.whiteColor),
                              ),
                              5.x,
                              ChipWidget(
                                labelText: "Contracts",
                                height: 60.sp,
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.whiteColor),
                              ),
                              5.x,
                              ChipWidget(
                                labelText: "Access",
                                height: 60.sp,
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.whiteColor),
                              ),
                              5.x,
                              ChipWidget(
                                labelText: "Availability",
                                height: 60.sp,
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.whiteColor),
                              ),
                              5.x
                            ],
                          ),
                        ),
                        10.y,
                        AppText('Documents',
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        10.y,
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.pdfIcon,
                              width: 40,
                              height: 50,
                            ),
                            10.x,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText("business portfolio.pdf",
                                    style: Styles.circularStdMedium(context,
                                        fontSize: 16.sp)),
                                AppText("656 kb",
                                    style: Styles.circularStdRegular(context,
                                        color: AppColors.lightGreyColor))
                              ],
                            ),
                            const Spacer(),
                            SvgPicture.asset(Assets.downloadIcon)
                          ],
                        ),
                        14.y,
                        AppText('Revenue history',
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        10.y,
                        FractionallySizedBox(
                          widthFactor: 1.07,
                          child: VerticalBarChart(),
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
                  child: Container(
                    child: SvgPicture.asset(
                      Assets.arrowBackIcon,
                      width: 20.sp,
                      height: 30.sp,
                      fit: BoxFit.fitWidth,
                    ),
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
