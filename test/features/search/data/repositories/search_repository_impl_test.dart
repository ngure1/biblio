import 'dart:convert';

import 'package:biblio/core/error/failure.dart';
import 'package:biblio/features/search/data/models/book_model.dart';
import 'package:biblio/features/search/data/repositories/search_repository_impl.dart';
import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/read_json.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late SearchRepositoryImpl searchRepositoryImpl;
  late MockSearchRemoteDataSource mockSearchRemoteDataSource;

  setUp(() {
    mockSearchRemoteDataSource = MockSearchRemoteDataSource();
    searchRepositoryImpl = SearchRepositoryImpl(
        searchRemoteDataSource: mockSearchRemoteDataSource);
  });

  const query = 'the psychology of money';
  final testModelList = SearchBookModel.fromJsonList(jsonDecode(
      readJson('helpers/dummyData/book_list_response.json'))['items']);
  final testEntityList = SearchBookModel.toEntityList(testModelList);
  group('SearchRepositoryImpl', () {
    test('returns a list of SearchBookEntity', () async {
      // arrange
      when(mockSearchRemoteDataSource.searchBooks(query))
          .thenAnswer((_) async => testModelList);

      // act
      final result = await searchRepositoryImpl.searchBooks(query);

      // assert
      expect(
        result,
        isA<Right<Failure, List<SearchBookEntity>>>().having(
            (r) => r.fold((l) => null, (r) => r),
            'value',
            equals(testEntityList)),
      );
    });
  });
}
