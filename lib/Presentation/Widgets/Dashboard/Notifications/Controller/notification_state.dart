import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Components/notification_model.dart';

abstract class NotificationCubitState {}

class NotificationInitial extends NotificationCubitState {}

class NotificationLoading extends NotificationCubitState {}

class NotificationLoaded extends NotificationCubitState {
  final List<NotificationModel>? notificationModel;

  NotificationLoaded({this.notificationModel});
}

class NotificationError extends NotificationCubitState {
  final String? error;

  NotificationError({this.error});
}
