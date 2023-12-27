import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/saved_loading.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/notification_tile.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

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
        body: BlocConsumer<NotificationCubit, NotificationState>(
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
                                  return ChatTile(
                                      data: state.notificationModel![index]);
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
