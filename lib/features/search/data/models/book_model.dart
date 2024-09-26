import 'package:biblio/features/search/domain/entities/search_book_entity.dart';

class SearchBookModel extends SearchBookEntity {
  const SearchBookModel(
      {required super.title, required super.author, required super.imageUrl});

  factory SearchBookModel.fromJson(Map<String, dynamic> json) {
    return SearchBookModel(
      title: json['volumeInfo']['title'],
      author: json['volumeInfo']['authors'][0],
      imageUrl: json['volumeInfo']['imageLinks']['thumbnail'],
    );
  }

  static List<SearchBookModel> fromJsonList(
      List<dynamic> jsonList) {
    return jsonList.map((item) {
      return SearchBookModel.fromJson(item);
    }).toList();
  }

  SearchBookEntity toEntity() {
    return SearchBookEntity(
      title: title,
      author: author,
      imageUrl: imageUrl,
    );
  }

  static List<SearchBookEntity> toEntityList(List<SearchBookModel> modelList) {
    return modelList.map((model) => model.toEntity()).toList();
  }
}
