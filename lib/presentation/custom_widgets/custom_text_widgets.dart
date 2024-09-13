import 'package:flutter/material.dart';

import 'package:starter_template_get_x/data/data.dart';
import 'package:starter_template_get_x/config/config.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
    this.maxLines,
    this.textAlign
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,

          ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class CustomNobelText extends StatelessWidget {
  const CustomNobelText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
    this.textAlign
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: themeIsLight
                ? LightThemeColors.nobelTextColor
                : DarkThemeColors.nobelTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
      textAlign: textAlign,

    );
  }
}

class CustomRhinoText extends StatelessWidget {
  const CustomRhinoText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
    this.textAlign
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: themeIsLight
                ? LightThemeColors.rhinoTextColor
                : DarkThemeColors.rhinoTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
      textAlign: textAlign,

    );
  }
}

class CustomBlueText extends StatelessWidget {
  const CustomBlueText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
    this.textAlign
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: themeIsLight
                ? LightThemeColors.blueTextColor
                : DarkThemeColors.blueTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
      textAlign: textAlign,

    );
  }
}

class CustomWildBlueText extends StatelessWidget {
  const CustomWildBlueText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
    this.textAlign
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: themeIsLight
                ? LightThemeColors.wildBlueTextColor
                : DarkThemeColors.wildBlueTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}

class CustomWhiteText extends StatelessWidget {
  const CustomWhiteText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w300,
    this.overflow,
    this.textAlign
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
      textAlign: textAlign,

    );
  }
}
