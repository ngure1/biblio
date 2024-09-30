import 'dart:convert';
import 'dart:io';

import 'package:biblio/core/constants/constants.dart';
import 'package:biblio/core/error/exeptions.dart';
import 'package:biblio/features/search/data/data_sources/remote_datasource.dart';
import 'package:biblio/features/search/data/models/book_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../../helpers/read_json.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late SearchRemoteDataSourceImpl searchRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    searchRemoteDataSourceImpl =
        SearchRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  const testQuery = 'the psychology of money';
  final testResponse = readJson('helpers/dummyData/book_list_response.json');
  final parsedJson = jsonDecode(testResponse);
  final testModelsList = SearchBookModel.fromJsonList(parsedJson['items']);

  group('SearchRemoteDataSourceImpl', () {
    test('return a list of book models on response code 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.search(testQuery))))
          .thenAnswer((_) async {
        return http.Response(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
          jsonEncode(jsonDecode(testResponse)),
          200,
        );
      });

      //act
      final result = await searchRemoteDataSourceImpl.searchBooks(testQuery);
      //assert
      expect(result, testModelsList);
    });

    test('return a ServerException on response code other than 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.search(testQuery))))
          .thenAnswer((_) async => http.Response('No content', 404));

      //act
      final result = searchRemoteDataSourceImpl.searchBooks(testQuery);
      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
