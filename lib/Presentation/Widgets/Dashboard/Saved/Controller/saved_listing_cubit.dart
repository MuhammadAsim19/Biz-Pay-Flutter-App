import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saved_listing_state.dart';

class SavedListingCubit extends Cubit<SavedListingState> {
  SavedListingCubit() : super(SavedListingInitial());
}
