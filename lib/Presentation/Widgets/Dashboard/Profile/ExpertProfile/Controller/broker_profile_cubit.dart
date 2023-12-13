import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'broker_profile_state.dart';

class BrokerProfileCubit extends Cubit<BrokerProfileState> {
  BrokerProfileCubit() : super(BrokerProfileInitial());
}
