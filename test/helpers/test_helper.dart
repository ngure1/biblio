import 'package:biblio/features/search/domain/repositories/search_book_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as htpp;

@GenerateMocks([
  SearchBookRepository,
], customMocks: [
  MockSpec<htpp.Client>(as: #MockHttpClient)
])
void main() {}
