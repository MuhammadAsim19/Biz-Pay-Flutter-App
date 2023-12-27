import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/CustomerSupport/customer_support.dart';
import 'package:meta/meta.dart';

part 'customer_support_state.dart';

class CustomerSupportCubit extends Cubit<CustomerSupportState> {
  CustomerSupportCubit() : super(CustomerSupportInitial());

  addIssue({Map<String, dynamic>? body, List<String?>? images}) async {
    await Future.delayed(Duration.zero);

    emit(CustomerSupportLoading());
    try {
      await CustomerSupport.addIssueTOSupport(body: body, images: images)
          .then((value) {
        if (value['Success']) {
          emit(CustomerSupportLoaded());
        }
      }).catchError((e) {
        emit(CustomerSupportError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(CustomerSupportError(error: e.toString()));
      rethrow;
    }
  }
}
