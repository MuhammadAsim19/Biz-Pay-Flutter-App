import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'your_business_state.dart';

class YourBusinessCubit extends Cubit<YourBusinessState> {
  YourBusinessCubit() : super(YourBusinessInitial());
}
