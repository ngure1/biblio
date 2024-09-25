import 'package:biblio/core/assets/assets.dart';
import 'package:biblio/core/common/widgets/icon_text.dart';
import 'package:biblio/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class ContinueReadingCard extends StatelessWidget {
  const ContinueReadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        child: Row(
          children: [
            Image.asset(
              AppImages.cover1,
              height: 110,
            ),
            const Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 55,
                  child: IconText(
                    foregroundColor: AppColors.onSurfaceContainer,
                    surfaceColor: AppColors.primaryInverseColor,
                    text: "4.9",
                    icon: AppVectors.star,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    "The Psychology of Money",
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.onSurfaceContainer,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    "Morgan Housel(2020)",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 6,
                  width: 180,
                  child: LinearProgressIndicator(
                    color: AppColors.primaryInverseColor,
                    backgroundColor: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(6),
                    value: 0.75,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
