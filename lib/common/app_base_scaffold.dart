import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class AppBaseScaffold extends StatelessWidget {
  AppBaseScaffold({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.floatingActionButton,
  });

  /// The widget to display in the body of the scaffold.
  final Widget child;

  /// The title to display in the app bar.
  final String? title;

  final List<Widget>? actions;

  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgOffWhiteColor,
      appBar: AppBar(
        centerTitle: false,
        systemOverlayStyle: overlay,
        backgroundColor: AppColors.appBlueColor,
        title: Text(
          title ?? '',
          style: AppTextStyles.fontA12.copyWith(color: AppColors.appWhiteColor),
        ),
        actions: actions,
        automaticallyImplyLeading: false, // Removes the back button
      ),
      floatingActionButton: floatingActionButton,
      body: child,
    );
  }

  final SystemUiOverlayStyle overlay = SystemUiOverlayStyle(
    statusBarColor: AppColors.appStatusBarColor,
    systemStatusBarContrastEnforced: false,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,

    /// For iOS it is dark to show white icon color.
    systemNavigationBarColor: AppColors.appStatusBarColor,
    systemNavigationBarContrastEnforced: false,
    systemNavigationBarDividerColor: AppColors.appBlueColor,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
