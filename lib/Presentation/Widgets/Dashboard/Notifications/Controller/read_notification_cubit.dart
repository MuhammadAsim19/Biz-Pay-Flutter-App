import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Repository/NotificationRepo/read_notification_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_tile_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/read_notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadNotificationCubit extends Cubit<ReadNotificationState> {
  ReadNotificationCubit() : super(ReadNotificationInitial());

  readNotification(String Id) async {
    await Future.delayed(Duration.zero);

    emit(ReadNotificationLoading());

    try {
      await ReadNotification.readNotification(Id).then((value) {
        log(value.toString());
        if (value['Success']) {
          emit(ReadNotificationLoaded());
        } else {
          emit(ReadNotificationError(error: value['error']));
        }
      }).catchError((e) {
        emit(ReadNotificationError(error: e.toString()));
        throw e;
      });
    } catch (e) {
      emit(ReadNotificationError(error: e.toString()));
      rethrow;
    }
  }
}
