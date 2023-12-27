import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Components/notification_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel>? notificationModel;

  NotificationLoaded({this.notificationModel});
}

class NotificationError extends NotificationState {
  final String? error;

  NotificationError({this.error});
}
