import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/DeleteBusiness/delete_business.dart';
import 'package:meta/meta.dart';

part 'delete_business_state.dart';

class DeleteBusinessCubit extends Cubit<DeleteBusinessState> {
  DeleteBusinessCubit() : super(DeleteBusinessInitial());

  deleteBusiness({String? businessId}) async {
    await Future.delayed(const Duration(microseconds: 5));

    emit(DeleteBusinessLoading());

    await DeleteBusiness.deleteBusiness(businessId: businessId).then((value) {
      if (value['Success']) {
        emit(DeleteBusinessLoaded());
      } else {
        emit(DeleteBusinessError(error: value['error']));
      }
    }).catchError((e) {
      emit(DeleteBusinessError(error: e.toString()));
    });
  }
}
