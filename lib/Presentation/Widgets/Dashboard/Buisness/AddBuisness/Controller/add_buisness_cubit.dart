import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../State/add_buisness_state.dart';

class AddBuisnessCubit extends Cubit<AddBuisnessState> {
  AddBuisnessCubit() : super(AddBuisnessInitial());
}
