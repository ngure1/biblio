import 'package:biblio/core/assets/assets.dart';
import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:biblio/features/search/domain/usecases/search_book_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late SearchBookUsecase searchBookUsecase;
  late MockSearchBookRepository mockSearchBookRepository;

  setUp(() {
    mockSearchBookRepository = MockSearchBookRepository();
    searchBookUsecase = SearchBookUsecase(repository: mockSearchBookRepository);
  });

  const testQuery = 'the psychology of money';
  const testBookList = [
    SearchBookEntity(
      title: 'The Psychology of Money',
      author: 'Dale Carnegie',
      imageUrl: AppImages.cover1,
    ),
    SearchBookEntity(
      title: 'The subtle art of not giving a f*ck',
      author: 'Dale Carnegie',
      imageUrl: AppImages.cover2,
    ),
    SearchBookEntity(
      title: 'Rich dad poor dad',
      author: 'Dale Carnegie',
      imageUrl: AppImages.cover3,
    ),
  ];

  test(
    'test that the repository passes data to the usecase',
    () async {
      // arrange
      when(mockSearchBookRepository.searchBooks(testQuery))
          .thenAnswer((_) async => const Right(testBookList));

      //act
      final result = await searchBookUsecase(testQuery);

      //assert
      expect(result, equals(const Right(testBookList)));
    },
  );
}
