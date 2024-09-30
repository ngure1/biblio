import 'package:biblio/features/search/data/data_sources/remote_datasource.dart';
import 'package:biblio/features/search/domain/repositories/search_book_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as htpp;

@GenerateMocks([
  SearchBookRepository,
  SearchRemoteDataSource,
], customMocks: [
  MockSpec<htpp.Client>(as: #MockHttpClient)
])
void main() {}
