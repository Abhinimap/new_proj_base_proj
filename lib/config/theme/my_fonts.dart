import 'package:flutter/material.dart';

import '../../data/services/my_shared_pref.dart';
import '../translations/localization_service.dart';

// todo configure text family and size
class MyFonts {
  MyFonts._();

  // return the right font depending on app language
  static TextStyle get getAppFontType =>
      LocalizationService.supportedLanguagesFontsFamilies[
          MySharedPref.getCurrentLocal().languageCode]!;

  // headlines text font
  static TextStyle get displayTextStyle => getAppFontType;

  // body text font
  static TextStyle get bodyTextStyle => getAppFontType;

  // text field text font
  static TextStyle get textFieldTextStyle => getAppFontType;

  // button text font
  static TextStyle get buttonTextStyle => getAppFontType;

  // app bar text font
  static TextStyle get appBarTextStyle => getAppFontType;

  // chips text font
  static TextStyle get chipTextStyle => getAppFontType;

  // appbar font size
  static double get appBarTittleSize => 20;

  // body font size
  static double get bodySmallTextSize => 14;

  static double get bodyMediumSize => 16; // default font
  static double get bodyLargeSize => 18;

  static const double defaultFontSize = 16;

  // display font size
  static double get displaySmallSize => 14;

  static double get displayMediumSize => 16;

  static double get displayLargeSize => 18;

  //button font size
  static double get buttonTextSize => 20;

  //chip font size
  static double get chipTextSize => 16;

  // list tile fonts sizes
  static double get listTileTitleSize => 16;

  static double get listTileSubtitleSize => 14;

  // custom themes (extensions)
  static double get employeeListItemNameSize => 16;

  static double get employeeListItemSubtitleSize => 14;
}
