import 'package:equatable/equatable.dart';

class SearchBookEntity extends Equatable {
  final String title;
  final String author;
  final String imageUrl;

  const SearchBookEntity({
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        title,
        author,
        imageUrl,
      ];
}
