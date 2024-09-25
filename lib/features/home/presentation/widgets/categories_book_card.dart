import 'package:flutter/material.dart';

class CategoriesBookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  const CategoriesBookCard(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.33,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 5),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
