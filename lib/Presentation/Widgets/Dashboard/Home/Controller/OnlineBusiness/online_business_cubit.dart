import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'online_business_state.dart';

class OnlineBusinessCubit extends Cubit<OnlineBusinessState> {
  OnlineBusinessCubit() : super(OnlineBusinessInitial());

  getBusiness() async {
    await Future.delayed(Duration.zero);

    emit(OnlineBusinessLoading());

    print('cubit call');

    try {
      await AllBusiness.onlineBusiness().then((value) {
        if (value['Success'] == true) {
          List<BusinessModel> business =
              List.from(value["body"].map((e) => BusinessModel.fromJson(e)));
          emit(OnlineBusinessLoaded(data: business));
        } else {
          emit(OnlineBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(OnlineBusinessError(error: e.toString()));
        throw e;
      });
    } catch (e) {
      emit(OnlineBusinessError(error: e.toString()));
      rethrow;
    }
  }
}
