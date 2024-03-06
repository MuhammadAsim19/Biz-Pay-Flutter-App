import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/ShowExpertProfiles/Controller/show_experts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowExpertsCubit extends Cubit<ShowExpertsState> {
  ShowExpertsCubit() : super(ShowExpertsInitial());

  getShowExperts({String? badgeID}) async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(ShowExpertsLoading());
    await BadgesRepo.getBrokerOfBadges(badgeId: badgeID).then((value) {
      if (value['Success']) {
        List<BrokersListModel> data = (value['body'] as List)
            .map((e) => BrokersListModel.fromJson(e))
            .toList();
        emit(ShowExpertsLoaded(profileData: data));
      } else {
        emit(ShowExpertsError(error: value['error']));
      }
    }).catchError((e) {
      emit(ShowExpertsError(error: 'Some Thing Wrong'));
      throw e;
    });
  }
}
