import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Repository/NotificationRepo/get_all_notification_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Components/notification_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationCubitState> {
  NotificationCubit() : super(NotificationInitial());

  void getNotificationCubitData() async {
    await Future.delayed(Duration.zero);
    emit(NotificationLoading());

    try {
      await GetAllNotificationRepo.getAllNotificationData().then((value) {
        log(value.toString());
        print(value.toString());
        if (value['Success']) {
          List<NotificationModel> notificationModel = List.from(
              value['body'].map((e) => NotificationModel.fromJson(e)));

          emit(NotificationLoaded(notificationModel: notificationModel));
        } else {
          emit(NotificationError(error: value['error']));
        }
      }).catchError((e) {
        emit(NotificationError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(NotificationError(error: e.toString()));
      rethrow;
    }
  }
}
