import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/strings.dart';

class OnboardingBody extends StatelessWidget {
  final String assetName;
  final String subtitle;
  const OnboardingBody({
    Key? key,
    required this.assetName,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SizedBox(
      width: deviceSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              top: 40,
              left: 40,
            ),
            child: SvgPicture.asset(AppStrings.logo),
          ),
          SvgPicture.asset(
            assetName,
            allowDrawingOutsideViewBox: true,
            height: deviceSize.height * 0.3,
            fit: BoxFit.none,
            clipBehavior: Clip.none,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 30,
              right: 30,
            ),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
