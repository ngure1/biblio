import 'package:biblio/features/search/domain/entities/search_book_entity.dart';

class SearchBookModel extends SearchBookEntity {
  const SearchBookModel({
    required super.title,
    required super.author,
    required super.imageUrl,
  });

  factory SearchBookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>;
    final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>?;

    return SearchBookModel(
      title: volumeInfo['title'] as String? ?? 'Unknown Title',
      author: _getAuthor(volumeInfo['authors']),
      imageUrl: _getImageUrl(imageLinks),
    );
  }

  static String _getAuthor(dynamic authors) {
    if (authors is List && authors.isNotEmpty) {
      return authors[0] as String;
    }
    return 'Unknown Author';
  }

  static String _getImageUrl(Map<String, dynamic>? imageLinks) {
    if (imageLinks != null) {
      return imageLinks['thumbnail'] as String? ??
          imageLinks['smallThumbnail'] as String? ??
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019';
    }
    return 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019';
  }

  static List<SearchBookModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => SearchBookModel.fromJson(item)).toList();
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
