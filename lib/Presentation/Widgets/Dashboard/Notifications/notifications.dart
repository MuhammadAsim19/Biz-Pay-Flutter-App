import 'dart:developer';

import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/saved_loading.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Components/notification_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/read_notification_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Components/notification_tile.dart';

class Notifications extends StatefulWidget {
  const Notifications({
    super.key,
  });

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    context.read<NotificationCubit>().getNotificationCubitData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: Padding(
              padding: EdgeInsets.only(left: 24.0.sp),
              child: const BackArrowWidget(),
            ),
            backgroundColor: AppColors.whiteColor,
            title: AppText('Notifications',
                style: Styles.circularStdBold(context,
                    color: const Color.fromRGBO(0, 0, 0, 1), fontSize: 18.sp))),
        body: BlocConsumer<NotificationCubit, NotificationCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            log(state.toString());
            return state is NotificationLoaded
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.sh,
                            width: 1.sw,
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  log(state.notificationModel![index].id!);
                                  return InkWell(
                                    onTap: () {
                                      context
                                          .read<ReadNotificationCubit>()
                                          .readNotification(state
                                              .notificationModel![index].id!);
                                      // Navigate.to(
                                      //     context,
                                      //     ChatDetailsScreen(
                                      //         modelId: state
                                      //             .notificationModel![index]
                                      //             .id!));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(13.sp),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          color: AppColors.whiteColor,
                                          border: Border.all(
                                              color: AppColors.borderColor)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AssetImageWidget(
                                              height: 50.h,
                                              width: 50.w,
                                              url: state
                                                  .notificationModel![index]
                                                  .icon!),
                                          15.x,
                                          Expanded(
                                            flex: 10,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    AppText(
                                                        state
                                                            .notificationModel![
                                                                index]
                                                            .message!,
                                                        style: Styles
                                                            .circularStdBold(
                                                                context,
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                    const Spacer(),
                                                    AppText(
                                                        state
                                                            .notificationModel![
                                                                index]
                                                            .message!
                                                            .toString(),
                                                        style: Styles
                                                            .circularStdRegular(
                                                                context,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .greyTextColor)),
                                                  ],
                                                ),
                                                5.y,
                                                AppText(
                                                    state
                                                        .notificationModel![
                                                            index]
                                                        .subCategory!,
                                                    maxLine: 1,
                                                    style: Styles
                                                        .circularStdRegular(
                                                            context,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .greyTextColor)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 20.h,
                                  );
                                },
                                itemCount: state.notificationModel!.length),
                          ),
                        ],
                      ),
                    ),
                  )
                : state is NotificationLoading
                    ? const SavedLoading()
                    : state is NotificationError
                        ? Center(
                            child: AppText(
                              state.error!,
                              style: Styles.circularStdRegular(context),
                            ),
                          )
                        : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
