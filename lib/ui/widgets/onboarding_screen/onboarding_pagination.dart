import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class OnboardingPagination extends StatelessWidget {
  final int pageIndex;
  const OnboardingPagination({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  Widget _buildIndicator(
      String text, Color color, Color textColor, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: color,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colorNormal = [
      AppColors.pageIndicatorBackground,
      AppColors.primaryButtonText,
    ];
    List<Color> colorHighligted = [
      Colors.white,
      Colors.black,
    ];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIndicator(
          '1',
          pageIndex == 0 ? colorHighligted[0] : colorNormal[0],
          pageIndex == 0 ? colorHighligted[1] : colorNormal[1],
          context,
        ),
        _buildIndicator(
          '2',
          pageIndex == 1 ? colorHighligted[0] : colorNormal[0],
          pageIndex == 1 ? colorHighligted[1] : colorNormal[1],
          context,
        ),
        _buildIndicator(
          '3',
          pageIndex == 2 ? colorHighligted[0] : colorNormal[0],
          pageIndex == 2 ? colorHighligted[1] : colorNormal[1],
          context,
        ),
      ],
    );
  }
}
