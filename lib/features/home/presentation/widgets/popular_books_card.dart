import 'package:biblio/core/assets/assets.dart';
import 'package:biblio/core/common/widgets/icon_text.dart';
import 'package:biblio/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class PopularBooksCard extends StatelessWidget {
  const PopularBooksCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: IconText(
              foregroundColor: Colors.black,
              surfaceColor: AppColors.surfaceColor,
              text: "Popular",
              icon: AppVectors.fire,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160,
                      child: Text(
                        "The Psychology of Money",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.onPrimaryContainer,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        "Morgan Housel(2020)",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.onPrimaryContainer,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                Image.asset(
                  AppImages.cover1,
                  height: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
