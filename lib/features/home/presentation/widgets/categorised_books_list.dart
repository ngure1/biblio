import 'package:biblio/core/assets/assets.dart';
import 'package:biblio/features/home/presentation/widgets/categories_book_card.dart';
import 'package:flutter/material.dart';

class CategorisedBooksList extends StatefulWidget {
  final TabController tabController;

  const CategorisedBooksList({super.key, required this.tabController});

  @override
  State<CategorisedBooksList> createState() => _CategorisedBooksListState();
}

class _CategorisedBooksListState extends State<CategorisedBooksList> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [
        _buildBookList("All genres"),
        _buildBookList("Fiction"),
        _buildBookList("Non-fiction"),
      ],
    );
  }

  Widget _buildBookList(String category) {
    final List dummyData = [
      {
        "title": "The Psychology of Money",
        "image": AppImages.cover1,
      },
      {
        "title": "The subtle art of not giving a f*ck",
        "image": AppImages.cover2
      },
      {"title": "Rich dad poor dad", "image": AppImages.cover3},
      {
        "title": "The Psychology of Money",
        "image": AppImages.cover1,
      },
      {
        "title": "The subtle art of not giving a f*ck",
        "image": AppImages.cover2
      },
      {
        "title": "Rich dad poor dad",
        "image": AppImages.cover3,
      }
    ];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return CategoriesBookCard(
          title: dummyData[index]["title"],
          imageUrl: dummyData[index]["image"],
        );
      },
    );
  }
}
