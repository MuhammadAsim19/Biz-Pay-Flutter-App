import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/AppData/app_initializer.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/recently_viewd_bussines_loading.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Saved/Controller/saved_listing_cubit.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/saved_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedListBusiness extends StatefulWidget {
  const SavedListBusiness({
    super.key,
  });

  @override
  State<SavedListBusiness> createState() => _SavedListBusinessState();
}

class _SavedListBusinessState extends State<SavedListBusiness> {
  @override
  void initState() {
    //AppInitializer.init();
    context.read<SavedListingCubit>().getWishlistData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocConsumer<SavedListingCubit, SavedListingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is SavedListingLoaded
              ? state.wishList!.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final data = state.wishList![index];

                        return GestureDetector(
                          onTap: () {
                            Navigate.to(context, BusinessDetails(id: data.id));
                            // widget.getData(widget.businessProducts[index]);
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 120.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFFEEF1F6)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                      ),
                                      child: CachedImage(
                                        isCircle: false,
                                        url:
                                            "${ApiConstant.baseurl}${data.images!.first}",
                                        width: 119.sp,
                                        height: 120.h,
                                      ),
                                    ),
                                    10.x,
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          15.y,
                                          AppText(
                                              "${data.city!},${data.country!}",
                                              style: Styles.circularStdRegular(
                                                  context,
                                                  color: AppColors
                                                      .lightGreyColor)),
                                          10.y,
                                          AppText(
                                            data.name!,
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 14),
                                            maxLine: 3,
                                          ),
                                          10.y,
                                          AppText("\$${data.salePrice!} USD",
                                              style: Styles.circularStdBold(
                                                  context)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 5,
                                  right: 10,
                                  child: SvgPicture.asset(Assets.heartRed))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 15.y;
                      },
                      itemCount: state.wishList!.length)
                  : SizedBox(
                      height: 0.70.sh,
                      width: 1.sw,
                      child: Center(
                        child: Text(
                          'Data Not Found',
                          style: Styles.circularStdMedium(context),
                        ),
                      ),
                    )
              : state is SavedListingLoading
                  ? const SavedLoading()
                  : state is SavedListingError
                      ? Center(
                          child: AppText(
                            state.error!,
                            style: Styles.circularStdRegular(context),
                          ),
                        )
                      : const SizedBox.shrink();
        },
      ),
    );
  }
}
