import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../State/search_listing_state.dart';

class SearchListingCubit extends Cubit<SearchListingState> {
  SearchListingCubit() : super(SearchListingInitial());
}
