import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconText extends StatelessWidget {
  final String icon;
  final String text;
  final Color foregroundColor;
  final Color surfaceColor;
  const IconText({
    super.key,
    required this.icon,
    required this.text,
    required this.foregroundColor,
    required this.surfaceColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'lib/core/assets/vectors/fire.svg',
            theme: SvgTheme(currentColor: foregroundColor),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
