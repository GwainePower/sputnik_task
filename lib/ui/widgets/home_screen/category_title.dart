import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/colors.dart';

class CategoryTitle extends StatelessWidget {
  final String titleText;
  const CategoryTitle({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final langs = AppLocalizations.of(context)!;
    final themeData = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: deviceSize.width * 0.6,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              titleText,
              style: themeData.textTheme.headline3,
            ),
          ),
        ),
        SizedBox(
          width: deviceSize.width * 0.2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: TextButton(
              onPressed: () {},
              child: Text(
                langs.viewAll,
                style: TextStyle(
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
