import 'package:biblio/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  const SearchBookCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * 0.35,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              author,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryColor,
                fontSize: 11,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
    );
  }
}
