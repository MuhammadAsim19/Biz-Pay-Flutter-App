import 'dart:developer';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_meta_data.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_services.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/notification_shimmer.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BrokerProfile/broker_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/broker_chat_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Components/notification_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/read_notification_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/read_notification_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/personal_information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Components/notification_model.dart';

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
    NotificationMetaData.routeNotifier.value = 'Notification';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        onPopInvoked: (didPop) {
          NotificationMetaData.routeNotifier.value = '';
          print('pop call');
        },
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              leading: Padding(
                padding: EdgeInsets.only(left: 20.0.sp),
                child: const BackArrowWidget(),
              ),
              backgroundColor: AppColors.whiteColor,
              title: AppText('Notifications',
                  style: Styles.circularStdBold(context,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18.sp))),
          body: BlocConsumer<NotificationCubit, NotificationCubitState>(
            listener: (context, state) {
              if (state is NotificationError) {
                WidgetFunctions.instance
                    .showErrorSnackBar(context: context, error: state.error);
              }
            },
            builder: (context, state) {
              log(state.toString());
              return state is NotificationLoaded
                  ? SizedBox(
                      height: 1.sh,
                      width: 1.sw,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            NotificationModel data =
                                state.notificationModel![index];
                            log(state.notificationModel![index].id!);
                            return BlocListener<ReadNotificationCubit,
                                ReadNotificationState>(
                              listener: (context, state) {
                                if (state is ReadNotificationLoading) {
                                  LoadingDialog.showLoadingDialog(context);
                                }
                                if (state is ReadNotificationLoaded) {
                                  Navigator.pop(context);
                                  context
                                      .read<NotificationCubit>()
                                      .getNotificationCubitData();
                                }
                                if (state is ReadNotificationError) {
                                  Navigator.pop(context);
                                  WidgetFunctions.instance.showErrorSnackBar(
                                      context: context, error: state.error);
                                }
                                // TODO: implement listener
                              },
                              child: InkWell(
                                onTap: () {
                                  if (data.clickAction != "") {
                                    _navigation(
                                        data.clickAction ?? "", data.info);
                                  }
                                  if (data.isRead != true) {
                                    context
                                        .read<ReadNotificationCubit>()
                                        .readNotification(data.id!);
                                  }
                                  // _navigation(data.)
                                },
                                child: NotificationTile(
                                    data: state.notificationModel![index]),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                          itemCount: state.notificationModel!.length),
                    )
                  : state is NotificationLoading
                      ? const NotificationLoadingShimmer()
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
      ),
    );
  }

  _navigation(String navigateTo, var info) {
    // PASSWORD_UPDATED
    // NEEDS_SUPPORT
    // USER_REPORTED
    // USER_REGISTERED
    // NEW_BUSINESS_CREATED
    // BUSIENESS_UPDATED
    // BROKER_PROFILE_CREATED

    switch (navigateTo) {
      case "NEW_BUSINESS_CREATED":
        navigate(
            context,
            BusinessDetails(
              isFromNotification: true,
              id: info,
            ));

      case "BUSINES_UPDATED":
        navigate(
            context,
            BusinessDetails(
              id: info,
            ));
      case "PROFILE_UPDATED":
        navigate(context, const PersonalInformation());
      case 'BUSINES_CHAT_STARTED':
        const BottomNavigationScreen(
          initialPage: 2,
        );
      case 'NEW_MESSEGE_TO_BROKER_CHAT':
        InboxRepo().initSocket(context, Data().user?.user?.id);
        navigate(
            context,
            BrokerChatDetailsScreen(
              chatDto: ChatTileApiModel.fromRawJson(info),
            ));

      case 'NEW_MESSEGE_TO_BUSIENSS_CHAT':
        InboxRepo().initSocket(context, Data().user?.user?.id);
        navigate(
            context,
            ChatDetailsScreen(
              chatDto: ChatTileApiModel.fromRawJson(info),
            ));
      case 'BROKER_PROFILE_CREATED':
        navigate(
            context,
            BrokerProfile(
              id: info,
            ));

      default:
        // Handle unknown navigateTo values, maybe return a default screen or throw an error.
        null;
    }
  }

  navigate(BuildContext context, Widget navigation) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return navigation;
      },
    ));
  }
}
