import 'package:flutter/material.dart';

import 'app_font_weights.dart';

/// The text styles for the App UI Kit.
const String _FONT_FAMILY = 'Roboto';

class AppTextStyles {
  static const TextStyle H4 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.semiBold,
    fontSize: 28,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle H1 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.semiBold,
    fontSize: 24,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle H2 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 20,
    // height: 42 / 38,
    // letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle H2LineHeight = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 20,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle H3Medium = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 16,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    // fontFeatures: _fontFeatures,
  );

  static const TextStyle H3 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.regular,
    fontSize: 16,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle P = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.regular,
    fontSize: 14,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle PMedium = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 14,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle subText = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.regular,
    fontSize: 10,
    // height: 42 / 38,
    // letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle subTextMedium = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 10,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  /////////////////////
  static const TextStyle fontA12 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 18,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle fontC7 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.semiBold,
    fontSize: 16,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle fontD8 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.regular,
    fontSize: 16,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle fontC8 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 16,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle text14Regular = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.regular,
    fontSize: 14,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  static const TextStyle text12Regular = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.regular,
    fontSize: 12,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );
  static const TextStyle f7 = TextStyle(
    fontFamily: _FONT_FAMILY,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.regular,
    fontSize: 14,
    //height: 42 / 38,
    //letterSpacing: -0.4,
    //fontFeatures: _fontFeatures,
  );

  /// The enabled font features.
  static const _fontFeatures = [
    FontFeature('ss01'),
    FontFeature('ss02'),
    FontFeature('ss03'),
    FontFeature('ss04'),
    FontFeature('ss06'),
  ];

  /// The disabled font features.
  static const disabledFontFeatures = [
    FontFeature('ss01', 0),
    FontFeature('ss02', 0),
    FontFeature('ss03', 0),
    FontFeature('ss04', 0),
    FontFeature('ss06', 0),
  ];
}
