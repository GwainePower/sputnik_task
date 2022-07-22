import 'package:flutter/material.dart';
import 'package:onboading_task/constants/strings.dart';

import '../../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final void Function()? onPressed;
  final Widget buttonContent;
  const PrimaryButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onPressed,
    this.buttonContent = const Text(AppStrings.nextText),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: onPressed == null
            ? null
            : LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.primaryButtonGradientStart,
                  AppColors.primaryButtonGradientEnd,
                ],
              ),
        color: onPressed == null ? AppColors.primaryButtonDisabled : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width,
            vertical: height,
          ),
          primary: Colors.transparent,
          onSurface: AppColors.primaryButtonText,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: buttonContent,
      ),
    );
  }
}
