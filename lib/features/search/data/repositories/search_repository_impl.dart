import 'dart:io';

import 'package:biblio/core/error/exeptions.dart';
import 'package:biblio/core/error/failure.dart';
import 'package:biblio/features/search/data/data_sources/remote_datasource.dart';
import 'package:biblio/features/search/data/models/book_model.dart';
import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:biblio/features/search/domain/repositories/search_book_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl extends SearchBookRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoryImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<SearchBookEntity>>> searchBooks(
      String query) async {
    try {
      final result = await searchRemoteDataSource.searchBooks(query);
      return Right(SearchBookModel.toEntityList(result));
    } on ServerException {
      return Left(ServerFailure('Opps a sever-side error occured'));
    } on SocketException {
      return Left(ConnectionFailure('Check your internet connection'));
    }
  }
}
