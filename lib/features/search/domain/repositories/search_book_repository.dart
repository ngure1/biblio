import 'package:biblio/core/error/failure.dart';
import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchBookRepository {
  Future<Either<Failure, List<SearchBookEntity>>> searchBooks(String query);
}
