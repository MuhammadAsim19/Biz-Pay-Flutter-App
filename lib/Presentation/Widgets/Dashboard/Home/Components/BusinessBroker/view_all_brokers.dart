import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BrokerProfile/broker_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ViewAllBrokers extends StatelessWidget {
  final List<BrokersListModel>? profileData;

  final void Function(BrokersListModel val) getData;

  const ViewAllBrokers({super.key, this.profileData, required this.getData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'View All Brokers',
        leading: true,
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            10.y,
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing: 0.5, // Spacing between columns
                  mainAxisSpacing: 10.5,
                  childAspectRatio: 0.75, // Spacing between rows
                ),
                itemCount: profileData!.length,
                // Replace this with your actual data list length
                itemBuilder: (BuildContext context, int index) {
                  // Replace this with your own widget or data for each grid item
                  return GestureDetector(
                    onTap: () {
                      // getData(profileData![index]);
                      Navigate.to(
                          context,
                          BrokerProfile(
                            id: profileData![index].id,
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: AppColors.whiteColor,
                      ),
                      child: Column(
                        children: [
                          5.y,
                          CachedImage(
                            isCircle: true,
                            radius: 40.sp,
                            url:
                                "${ApiConstant.baseurl}${profileData![index].userInfo!.profilePic}",
                            height: 120.sp,
                            width: 120.sp,
                          ),
                          15.y,
                          AppText(profileData![index].designation ?? "",
                              maxLine: 2,
                              style: Styles.circularStdRegular(context,
                                  color: AppColors.lightGreyColor,
                                  fontSize: 12.sp)),
                          5.y,
                          AppText(
                              "${profileData![index].firstName} ${profileData![index].lastName}",
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //5.x,
                                for (int i = 0;
                                    i <
                                        profileData![index]
                                            .industriesServed!
                                            .length;
                                    i++)
                                  i == 2
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppText(
                                                "+${profileData![index].industriesServed!.length - 2}",
                                                style:
                                                    Styles.circularStdRegular(
                                                        context,
                                                        fontSize: 12,
                                                        color: AppColors
                                                            .blackColor)),
                                          ],
                                        )
                                      : i <= 1
                                          ? Row(
                                              children: [
                                                ChipWidget(
                                                  chipColor:
                                                      AppColors.primaryColor,
                                                  textColor:
                                                      AppColors.whiteColor,
                                                  labelText: profileData![index]
                                                      .industriesServed![i]
                                                      .title,
                                                  width: null,
                                                  height: 30,
                                                ),
                                                2.x,
                                                i == 1 ? 0.x : 5.x,
                                              ],
                                            )
                                          : const SizedBox(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
