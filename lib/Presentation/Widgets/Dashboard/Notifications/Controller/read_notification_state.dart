abstract class ReadNotificationState {}

class ReadNotificationInitial extends ReadNotificationState {}

class ReadNotificationLoading extends ReadNotificationState {}

class ReadNotificationLoaded extends ReadNotificationState {}

class ReadNotificationError extends ReadNotificationState {
  final String? error;

  ReadNotificationError({this.error});
}
