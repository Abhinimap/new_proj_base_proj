import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/config.dart';
import 'package:starter_template_get_x/presentation/presentation.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.maxLines = 1,
    this.hint = "Enter here",
    this.inputFormatters,
    this.readOnly = false,
    this.borderWidth = 1.6,
    this.controller,
    this.textFieldHeight = 56,
    this.borderColor = ColorName.lavenderMist,
    this.textInputAction = TextInputAction.next,
    this.textStyle,
  });

  final TextInputAction textInputAction;

  final int maxLines;
  final double borderWidth;
  final double textFieldHeight;

  final String hint;

  final bool readOnly;

  final Widget? suffix;
  final Widget? prefix;

  final Color borderColor;

  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  final void Function(String)? onChanged;

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    late TextStyle style;
    style = textStyle ??
        MyFonts.buttonTextStyle.copyWith(fontWeight: FontWeight.w400);
    return Container(
      color: Colors.white,
      child: TextField(
        controller: controller,
        minLines: 1,
        maxLines: maxLines,
        readOnly: readOnly,
        textInputAction: textInputAction,
        style: style,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          hintStyle: MyFonts.buttonTextStyle.copyWith(
            color: LightThemeColors.wildBlueTextColor,
          ),
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
