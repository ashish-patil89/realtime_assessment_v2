import 'package:flutter/material.dart';

import '../utils/app_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.fixedSize,
  });

  final String title;

  final VoidCallback? onPressed;

  final Color backgroundColor;

  final Color textColor;

  final Size? fixedSize;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        fixedSize: fixedSize,
        backgroundColor: backgroundColor, // Change button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6), // Change corner radius
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.fontA12.copyWith(color: textColor),
      ),
    );
  }
}
