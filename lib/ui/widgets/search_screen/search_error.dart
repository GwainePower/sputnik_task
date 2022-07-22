import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class SearchError extends StatelessWidget {
  final String text;
  const SearchError({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.errorBackground,
          child: const Icon(Icons.warning_rounded, size: 50),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.errorText,
            fontSize: 24,
          ),
        )
      ],
    );
  }
}
