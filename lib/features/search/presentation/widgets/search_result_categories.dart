import 'package:biblio/core/assets/assets.dart';
import 'package:biblio/features/search/presentation/widgets/search_book_card.dart';
import 'package:flutter/material.dart';

class SearchResultCategories extends StatefulWidget {
  final TabController tabController;

  const SearchResultCategories({super.key, required this.tabController});

  @override
  State<SearchResultCategories> createState() => _SearchResultCategoriesState();
}

class _SearchResultCategoriesState extends State<SearchResultCategories> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [
        _buildBookList(),
        _buildBookList(),
        _buildBookList(),
      ],
    );
  }

  Widget _buildBookList() {
    final List dummyData = [
      {
        "title": "The Psychology of Money",
        "author": "Dale Carnegie",
        "image": AppImages.cover1,
      },
      {
        "title": "The subtle art of not giving a f*ck",
        "author": "Dale Carnegie",
        "image": AppImages.cover2
      },
      {
        "title": "Rich dad poor dad",
        "author": "Dale Carnegie",
        "image": AppImages.cover3,
      },
      {
        "title": "The Psychology of Money",
        "author": "Alexandre Dumas",
        "image": AppImages.cover1,
      },
      {
        "title": "The subtle art of not giving a f*ck",
        "author": "Benjamin Graham",
        "image": AppImages.cover2
      },
      {
        "title": "Rich dad poor dad",
        "author": "Robert Kiyosaki",
        "image": AppImages.cover3
      },
      {
        "title": "The Psychology of Money",
        "author": "Alexandre Dumas",
        "image": AppImages.cover1,
      },
    ];
    return GridView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return SearchBookCard(
            title: dummyData[index]["title"],
            author: dummyData[index]["author"],
            imageUrl: dummyData[index]["image"],
          );
        });
  }
}
