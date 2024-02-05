import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisness_profile.dart';
import 'package:buysellbiz/Presentation/Common/chip_widget.dart';
import 'package:buysellbiz/Presentation/Common/custom_rating_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BusinessProfileWidget extends StatelessWidget {
  final List<BrokersListModel>? profileData;

  final void Function(BrokersListModel val) getData;

  const BusinessProfileWidget(
      {super.key, required this.profileData, required this.getData});

  @override
  Widget build(BuildContext context) {
    return profileData!.isNotEmpty
        ? ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  getData(profileData![index]);
                },
                child: Container(
                  width: 181.w,
                  height: 257.sp,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFEEF1F6)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      5.y,
                      CachedImage(
                        isCircle: true,
                        radius: 40.sp,
                        url:
                            "${ApiConstant.baseurl}${profileData![index].userInfo?.profilePic}",
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
                        physics: const BouncingScrollPhysics(),
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
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 12,
                                                color: AppColors.blackColor)),
                                      ],
                                    )
                                  : i <= 1
                                      ? Row(
                                          children: [
                                            ChipWidget(
                                              chipColor: AppColors.primaryColor,
                                              textColor: AppColors.whiteColor,
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
            separatorBuilder: (context, index) {
              return 5.x;
            },
            itemCount: profileData!.length)
        : Center(
            child: Padding(
              padding: EdgeInsets.only(left: 30.0.sp),
              child: AppText(
                'Data not found',
                style: Styles.circularStdRegular(context),
              ),
            ),
          );
  }
}
