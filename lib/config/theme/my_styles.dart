import 'package:flutter/material.dart';

import '../config.dart';

class MyStyles {
  /// Custom employee list item theme
  static EmployeeListItemThemeData getEmployeeListItemTheme({
    required bool isLightTheme,
  }) {
    return EmployeeListItemThemeData(
      backgroundColor: isLightTheme
          ? LightThemeColors.employeeListItemBackgroundColor
          : DarkThemeColors.employeeListItemBackgroundColor,
      iconTheme: IconThemeData(
        color: isLightTheme
            ? LightThemeColors.employeeListItemIconsColor
            : DarkThemeColors.employeeListItemIconsColor,
      ),
      nameTextStyle: MyFonts.bodyTextStyle.copyWith(
        fontSize: MyFonts.employeeListItemNameSize,
        fontWeight: FontWeight.bold,
        color: isLightTheme
            ? LightThemeColors.employeeListItemNameColor
            : DarkThemeColors.employeeListItemNameColor,
      ),
      subtitleTextStyle: MyFonts.bodyTextStyle.copyWith(
        fontSize: MyFonts.employeeListItemSubtitleSize,
        fontWeight: FontWeight.normal,
        color: isLightTheme
            ? LightThemeColors.employeeListItemSubtitleColor
            : DarkThemeColors.employeeListItemSubtitleColor,
      ),
    );
  }

  /// Custom header theme
  static HeaderContainerThemeData getHeaderContainerTheme({
    required bool isLightTheme,
  }) =>
      HeaderContainerThemeData(
          decoration: BoxDecoration(
        color: isLightTheme
            ? LightThemeColors.headerContainerBackgroundColor
            : DarkThemeColors.headerContainerBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ));

  /// Icons theme
  static IconThemeData getIconTheme({required bool isLightTheme}) =>
      IconThemeData(
        color: isLightTheme
            ? LightThemeColors.iconColor
            : DarkThemeColors.iconColor,
      );

  /// Appbar Theme
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) =>
      AppBarTheme(
        elevation: 0,
        titleTextStyle:
            getTextTheme(isLightTheme: isLightTheme).bodyMedium!.copyWith(
                  // color: Colors.white,
                  fontSize: MyFonts.appBarTittleSize,
                  fontWeight: FontWeight.w600,
                  color: isLightTheme
                      ? LightThemeColors.appBarTextColor
                      : Colors.white,
                ),
        iconTheme: IconThemeData(
            color: isLightTheme
                ? LightThemeColors.appBarIconsColor
                : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme
            ? LightThemeColors.appBarColor
            : DarkThemeColors.appbarColor,
      );

  ///Text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        labelLarge: MyFonts.buttonTextStyle.copyWith(
          fontSize: MyFonts.buttonTextSize,
        ),
        bodySmall: TextStyle(
          color: isLightTheme
              ? LightThemeColors.primaryLightTextColor
              : DarkThemeColors.bodySmallTextColor,
          fontSize: MyFonts.bodySmallTextSize,
        ),
        bodyMedium: (MyFonts.bodyTextStyle).copyWith(
          fontSize: MyFonts.bodyMediumSize,
          fontWeight: FontWeight.w500,
          color: isLightTheme
              ? LightThemeColors.primaryLightTextColor
              : DarkThemeColors.bodyTextColor,
        ),
        bodyLarge: (MyFonts.bodyTextStyle).copyWith(
          fontWeight: FontWeight.bold,
          fontSize: MyFonts.bodyLargeSize,
          color: isLightTheme
              ? LightThemeColors.primaryLightTextColor
              : DarkThemeColors.bodyTextColor,
        ),
        displaySmall: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displaySmallSize,
          fontWeight: FontWeight.bold,
          color: isLightTheme
              ? LightThemeColors.primaryLightTextColor
              : DarkThemeColors.displayTextColor,
        ),
        displayMedium: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displayMediumSize,
          fontWeight: FontWeight.bold,
          color: isLightTheme
              ? LightThemeColors.primaryLightTextColor
              : DarkThemeColors.displayTextColor,
        ),
        displayLarge: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displayLargeSize,
          fontWeight: FontWeight.bold,
          color: isLightTheme
              ? LightThemeColors.primaryLightTextColor
              : DarkThemeColors.displayTextColor,
        ),
      );

  static ChipThemeData getChipTheme({required bool isLightTheme}) {
    return ChipThemeData(
      backgroundColor: isLightTheme
          ? LightThemeColors.chipBackground
          : DarkThemeColors.chipBackground,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      selectedColor: Colors.black,
      disabledColor: Colors.green,
      padding: const EdgeInsets.all(5),
      secondarySelectedColor: Colors.purple,
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool isLightTheme}) {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: isLightTheme
          ? LightThemeColors.chipTextColor
          : DarkThemeColors.chipTextColor,
    );
  }

  // elevated button text style
  static WidgetStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      bool isLightTheme,
      {bool isBold = true,
      double? fontSize}) {
    return WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            color: isLightTheme
                ? LightThemeColors.buttonTextColor
                : DarkThemeColors.buttonTextColor,
          );
        } else if (states.contains(WidgetState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
            fontSize: 45,
            fontWeight: FontWeight.w800,
            color: isLightTheme
                ? LightThemeColors.buttonDisabledTextColor
                : DarkThemeColors.buttonDisabledTextColor,
          );
        }
        return MyFonts.buttonTextStyle.copyWith(
          fontSize: fontSize ?? MyFonts.buttonTextSize,
          fontWeight: FontWeight.w800,
          color: isLightTheme
              ? LightThemeColors.buttonTextColor
              : DarkThemeColors.buttonTextColor,
        ); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme(
          {required bool isLightTheme}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              //side: BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
          padding:
              WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.only(
            bottom: 8,
            top: 8,
            left: 12,
            right: 12,
          )),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              return Colors.transparent;
              return isLightTheme
                  ? LightThemeColors.primaryColor
                  : DarkThemeColors.buttonDisabledColor;
              if (states.contains(WidgetState.pressed)) {
                return isLightTheme
                    ? LightThemeColors.buttonColor.withOpacity(0.5)
                    : DarkThemeColors.buttonColor.withOpacity(0.5);
              } else if (states.contains(WidgetState.disabled)) {
                return isLightTheme
                    ? LightThemeColors.primaryColor
                    : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme
                  ? LightThemeColors.buttonColor
                  : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );

  /// list tile theme data
  static ListTileThemeData getListTileThemeData({required bool isLightTheme}) {
    return ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      iconColor: isLightTheme
          ? LightThemeColors.listTileIconColor
          : DarkThemeColors.listTileIconColor,
      tileColor: isLightTheme
          ? LightThemeColors.listTileBackgroundColor
          : DarkThemeColors.listTileBackgroundColor,
      titleTextStyle: TextStyle(
        fontSize: MyFonts.listTileTitleSize,
        color: isLightTheme
            ? LightThemeColors.listTileTitleColor
            : DarkThemeColors.listTileTitleColor,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: MyFonts.listTileSubtitleSize,
        color: isLightTheme
            ? LightThemeColors.listTileSubtitleColor
            : DarkThemeColors.listTileSubtitleColor,
      ),
    );
  }
}
