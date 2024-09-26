import 'dart:convert';
import 'package:biblio/features/search/data/models/book_model.dart';
import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/read_json.dart';

void main() {
  const tSearchBookModel = SearchBookModel(
    title: 'The Psychology of Money',
    author: 'Morgan Housel',
    imageUrl:
        'http://books.google.com/books/publisher/content?id=m_xcEAAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70ERVedqdjq5j-6dNar1QykrXHSoulre85uHHJkUVM-iRNEvN7OTEmdbTbLVVoDE4PxgJ8rOX9FGJvuKDo-9nUXUCIxca2A1ET-Z7_ND_65XlUAYbRG3BJHdLBQRem_as_iumF0&source=gbs_api',
  );
  const tSearchBookEntity = SearchBookEntity(
    title: 'The Psychology of Money',
    author: 'Morgan Housel',
    imageUrl:
        'http://books.google.com/books/publisher/content?id=m_xcEAAAQBAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70ERVedqdjq5j-6dNar1QykrXHSoulre85uHHJkUVM-iRNEvN7OTEmdbTbLVVoDE4PxgJ8rOX9FGJvuKDo-9nUXUCIxca2A1ET-Z7_ND_65XlUAYbRG3BJHdLBQRem_as_iumF0&source=gbs_api',
  );
  const firstBookModel = SearchBookModel(
    title: 'The Psychology of Money',
    author: 'Morgan Housel',
    imageUrl:
        'http://books.google.com/books/content?id=m_xcEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
  );
  const firstBookEntity = SearchBookEntity(
    title: 'The Psychology of Money',
    author: 'Morgan Housel',
    imageUrl:
        'http://books.google.com/books/content?id=m_xcEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
  );

  test('return an entity from a model', () {
    //act
    final result = tSearchBookModel.toEntity();
    //assert
    expect(result, tSearchBookEntity);
  });

  test('returns a valid book model from json', () {
    //arrange
    final json =
        jsonDecode(readJson('helpers/dummyData/search_book_response.json'));
    //act
    final result = SearchBookModel.fromJson(json);
    //assert
    expect(result, tSearchBookModel);
  });

  test('returns a list of models from json response', () {
    //arrange
    final jsonList =
        jsonDecode(readJson('helpers/dummyData/book_list_response.json'));
    //act
    final result = SearchBookModel.fromJsonList(jsonList['items']);
    //assert
    expect(result.first, firstBookModel);
  });

  test('returns a list of entities from a list of models', () {
    //arrange
    final jsonList =
        jsonDecode(readJson('helpers/dummyData/book_list_response.json'));
    final modelList = SearchBookModel.fromJsonList(jsonList['items']);
    //act
    final result = SearchBookModel.toEntityList(modelList);
    //assert
    expect(result.first, firstBookEntity);
  });
}
