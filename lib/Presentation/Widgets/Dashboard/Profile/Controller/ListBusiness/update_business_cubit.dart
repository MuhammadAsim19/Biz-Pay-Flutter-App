import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:meta/meta.dart';

part 'update_business_state.dart';

class UpdateBusinessCubit extends Cubit<UpdateBusinessState> {
  UpdateBusinessCubit() : super(UpdateBusinessInitial());

  updateBusinessById({Map<String, dynamic>? data, String? bsId}) async {
    await Future.delayed(Duration.zero);

    emit(UpdateBusinessLoading());

    try {
      await AllBusiness.updateBusiness(body: data, businessId: bsId)
          .then((value) {
        if (value['Success']) {
          emit(UpdateBusinessLoaded());
        } else {
          emit(UpdateBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(UpdateBusinessError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(UpdateBusinessError(error: e.toString()));
      rethrow;
    }
  }
}
