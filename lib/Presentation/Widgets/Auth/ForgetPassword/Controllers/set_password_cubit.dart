import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'State/set_password_state.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  SetPasswordCubit() : super(SetPasswordInitial());

  setPassword() async {}
}
