import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    on<SearchInitialEvent>((event, emit) {
      emit(SearchInitialState());
    });
  }
}
