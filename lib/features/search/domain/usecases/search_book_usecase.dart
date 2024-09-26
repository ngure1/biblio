import 'package:biblio/core/error/failure.dart';
import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:biblio/features/search/domain/repositories/search_book_repository.dart';
import 'package:dartz/dartz.dart';

class SearchBookUsecase {
  final SearchBookRepository repository;

  SearchBookUsecase({required this.repository});

  Future<Either<Failure, List<SearchBookEntity>>> call(String query) {
    return repository.searchBooks(query);
  }
}
