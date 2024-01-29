import 'dart:developer';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_meta_data.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_services.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/notification_shimmer.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Components/notification_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/read_notification_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/read_notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                                    return BlocListener<ReadNotificationCubit,
                                        ReadNotificationState>(
                                      listener: (context, state) {
                                        if (state is ReadNotificationLoading) {
                                          LoadingDialog.showLoadingDialog(
                                              context);
                                        }
                                        if (state is ReadNotificationLoaded) {
                                          Navigator.pop(context);
                                          context
                                              .read<NotificationCubit>()
                                              .getNotificationCubitData();
                                        }
                                        if (state is ReadNotificationError) {
                                          Navigator.pop(context);
                                          WidgetFunctions.instance
                                              .showErrorSnackBar(
                                                  context: context,
                                                  error: state.error);
                                        }
                                        // TODO: implement listener
                                      },
                                      child: NotificationTile(
                                          data:
                                              state.notificationModel![index]),
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
}
