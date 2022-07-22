import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionCard extends StatelessWidget {
  final String iconAsset;
  final String title;
  const OptionCard({
    Key? key,
    required this.iconAsset,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: SvgPicture.asset(iconAsset),
          title: Text(title),
        ),
      ),
    );
  }
}
