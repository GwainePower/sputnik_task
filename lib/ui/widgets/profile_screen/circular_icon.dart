import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CircularIcon extends StatelessWidget {
  final IconData icon;
  const CircularIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: AppColors.searchBackground,
      foregroundColor: AppColors.primaryText,
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
      ),
    );
  }
}
