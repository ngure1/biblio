part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitialEvent extends SearchEvent {}

class SearchBookEvent extends SearchEvent {
  final String query;
  const SearchBookEvent({required this.query});
}