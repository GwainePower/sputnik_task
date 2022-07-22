import 'package:flutter/material.dart';

class IconInfo extends StatelessWidget {
  final IconData icon;
  final int count;
  final Color foregroundColor;
  final Color backgroundColor;
  const IconInfo({
    Key? key,
    required this.icon,
    required this.count,
    required this.foregroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: foregroundColor,
            size: 13,
          ),
          Text(
            '$count',
            style: TextStyle(
                color: foregroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
