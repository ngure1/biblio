import 'dart:convert';

import 'package:biblio/core/constants/constants.dart';
import 'package:biblio/core/error/exeptions.dart';
import 'package:biblio/features/search/data/models/book_model.dart';
import 'package:http/http.dart' as http;

abstract class SearchRemoteDataSource {
  Future<List<SearchBookModel>> searchBooks(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final http.Client httpClient;

  SearchRemoteDataSourceImpl({required this.httpClient});
  @override
  Future<List<SearchBookModel>> searchBooks(String query) async {
    final response = await httpClient.get(Uri.parse(Urls.search(query)));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return SearchBookModel.fromJsonList(json['items']);
    } else {
      throw ServerException();
    }
  }
}
