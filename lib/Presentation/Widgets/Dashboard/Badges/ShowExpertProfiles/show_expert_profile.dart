import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/badgeModel.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/SendBadgeRequest/send_badge_request.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/ShowExpertProfiles/Controller/show_experts_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/ShowExpertProfiles/Controller/show_experts_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShowTheExpertProfiles extends StatefulWidget {
  final BadgeModel? badgesModel;
  final String? businessId;
  final String? type;

  // final void Function(BrokersListModel val) getData;

  const ShowTheExpertProfiles(
      {super.key, this.badgesModel, this.businessId, this.type});

  @override
  State<ShowTheExpertProfiles> createState() => _ShowTheExpertProfilesState();
}

class _ShowTheExpertProfilesState extends State<ShowTheExpertProfiles> {
  List<BrokersListModel>? profileData;

  @override
  void initState() {
    context
        .read<ShowExpertsCubit>()
        .getShowExperts(badgeID: widget.badgesModel!.id);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Brokers',
        leading: true,
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: BlocConsumer<ShowExpertsCubit, ShowExpertsState>(
          listener: (context, state) {
            if (state is ShowExpertsLoading) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is ShowExpertsLoaded) {
              profileData = state.profileData;
              Navigator.of(context).pop(true);
            }
            if (state is ShowExpertsError) {
              WidgetFunctions.instance.snackBar(context, text: state.error);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return state is ShowExpertsLoaded
                ? state.profileData!.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items per row
                          crossAxisSpacing: 0.5, // Spacing between columns
                          mainAxisSpacing: 10.5,
                          childAspectRatio: 0.70, // Spacing between rows
                        ),
                        itemCount: state.profileData!.length,
                        // Replace this with your actual data list length
                        itemBuilder: (BuildContext context, int index) {
                          // Replace this with your own widget or data for each grid item
                          return GestureDetector(
                            onTap: () {
                              // getData(profileData![index]);
                              Navigate.to(
                                  context,
                                  SendBadgeRequest(
                                    badgeData: widget.badgesModel,
                                    expertId: state.profileData![index].id,
                                    type: widget.type,
                                    businessId: widget.businessId,
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 12.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 1),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  5.y,
                                  Expanded(
                                    child: CachedImage(
                                      isCircle: true,
                                      radius: 40.sp,
                                      url:
                                          "${ApiConstant.baseurl}${state.profileData![index].userInfo?.profilePic}",
                                      height: 120.sp,
                                      width: 120.sp,
                                    ),
                                  ),
                                  15.y,
                                  AppText(
                                      state.profileData![index].designation ??
                                          "",
                                      maxLine: 2,
                                      style: Styles.circularStdRegular(context,
                                          color: AppColors.lightGreyColor,
                                          fontSize: 12.sp)),
                                  5.y,
                                  AppText(
                                      "${state.profileData![index].firstName} ${state.profileData![index].lastName}",
                                      maxLine: 2,
                                      textAlign: TextAlign.center,
                                      style: Styles.circularStdMedium(context,
                                          fontSize: 18.sp)),
                                  10.y,
                                  RatingBar(
                                    ignoreGestures: true,
                                    initialRating: 4.0,
                                    itemSize: 20,
                                    ratingWidget: RatingWidget(
                                      full: SvgPicture.asset(Assets.starIcon),
                                      half: SvgPicture.asset(Assets.starIcon),
                                      empty: SvgPicture.asset(
                                        Assets.starIcon,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onRatingUpdate: (value) {},
                                    tapOnlyMode: true,
                                    updateOnDrag: false,
                                  ),
                                  15.y,
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  state.profileData![index]
                                                      .industriesServed!.length;
                                              i++)
                                            ChipWidget(
                                              chipColor: AppColors.primaryColor,
                                              textColor: AppColors.whiteColor,
                                              labelText: state
                                                  .profileData![index]
                                                  .industriesServed![i]
                                                  .title,
                                              width: null,
                                              height: 30,
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: AppText('Data not found',
                            style: Styles.circularStdRegular(context,
                                fontSize: 14.sp)),
                      )
                : state is ShowExpertsError
                    ? Center(
                        child: Text(
                        state.error ?? "",
                        style:
                            Styles.circularStdRegular(context, fontSize: 12.sp),
                      ))
                    : const SizedBox();
          },
        ),
      ),
    );
  }
}
