import 'package:biblio/features/search/domain/entities/search_book_entity.dart';
import 'package:biblio/features/search/presentation/widgets/search_book_card.dart';
import 'package:flutter/material.dart';

class SearchResultCategories extends StatefulWidget {
  final TabController tabController;
  final List<SearchBookEntity> books;

  const SearchResultCategories(
      {super.key, required this.tabController, required this.books});

  @override
  State<SearchResultCategories> createState() => _SearchResultCategoriesState();
}

class _SearchResultCategoriesState extends State<SearchResultCategories> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [
        _buildBookList(widget.books),
        _buildBookList(widget.books),
        _buildBookList(widget.books),
      ],
    );
  }

  Widget _buildBookList(List<SearchBookEntity> books) {
    return GridView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return SearchBookCard(
            title: books[index].title,
            author: books[index].author,
            imageUrl: books[index].imageUrl,
          );
        });
  }
}
