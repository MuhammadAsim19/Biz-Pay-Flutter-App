abstract class RequestDetailState {}

class RequestDetailInitial extends RequestDetailState {}

class RequestDetailLoading extends RequestDetailState {}

class RequestDetailLoaded extends RequestDetailState {}

class RequestDetailError extends RequestDetailState {
  final String? error;

  RequestDetailError({this.error});
}
