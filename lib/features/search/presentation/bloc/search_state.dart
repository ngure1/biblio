part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchActionState extends SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<SearchBookEntity> books;
  const SearchLoadedState({required this.books});
}

class SearchErrorState extends SearchState {
  final String message;
  const SearchErrorState({required this.message});
}
