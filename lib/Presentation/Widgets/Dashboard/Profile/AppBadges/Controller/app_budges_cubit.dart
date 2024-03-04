import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Application/Services/PaymentServices/badges.dart';
import 'package:buysellbiz/Domain/AppBadges/badges_model.dart';
import 'package:meta/meta.dart';

part 'app_budges_state.dart';

class AppBudgesCubit extends Cubit<AppBudgesState> {
  AppBudgesCubit() : super(AppBudgesInitial());

  getBadges() async {
    print('called');
    emit(AppBudgesLoading());
    await AppBadges.getAppBadges().then((value) {
      if (value['Success']) {
        List<AppBadgesModel>? appBadges =
            List.from(value['body'].map((e) => AppBadgesModel.fromJson(e)));
        emit(AppBudgesLoaded(appBadges: appBadges));
      } else {
        emit(AppBudgesError(error: value['error']));
      }
    }).catchError((e) {
      emit(AppBudgesError(error: 'Some Thing Wrong'));
      throw e;
    });
  }
}
