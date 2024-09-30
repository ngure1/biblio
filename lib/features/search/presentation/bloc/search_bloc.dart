import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:biblio/features/search/domain/usecases/search_book_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchBookUsecase searchBookUseCase;

  SearchBloc({required this.searchBookUseCase}) : super(SearchInitialState()) {
    on<SearchInitialEvent>((event, emit) {
      emit(SearchInitialState());
    });

    on<SearchBookEvent>(
      (event, emit) async {
        if (event.query.isEmpty) {
          emit(SearchInitialState());
        } else {
          emit(SearchLoadingState());
          try {
            // Simulate API call
            final result = await searchBookUseCase(event.query);
            result.fold(
              (failure) => emit(SearchErrorState(message: failure.message)),
              (books) => emit(SearchLoadedState(books: books)),
            );
          } catch (e) {
            emit(SearchErrorState(message: e.toString()));
          }
        }
      },
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 200))
          .switchMap(mapper),
    );
  }
}
