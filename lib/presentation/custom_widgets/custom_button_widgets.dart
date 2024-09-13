import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../config/config.dart';
import 'package:starter_template_get_x/presentation/presentation.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    this.width,
    this.onPressed,
    this.height = 58,
    this.fontSize = 16,
    this.borderRadius = 4,
    this.buttonText = "Create Announcement",
    this.buttonTextExpand = false,
    this.prefixIcon,
  });

  final Widget? prefixIcon;
  final double height;
  final double? width;
  final double fontSize;
  final double borderRadius;
  final String buttonText;
  final Function()? onPressed;
  final bool buttonTextExpand;

  @override
  State<StatefulWidget> createState() {
    return _PrimaryButton();
  }
}

class _PrimaryButton extends State<PrimaryButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.buttonText,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: LightThemeColors.primaryColor,
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: MyFonts.buttonTextStyle.copyWith(
              fontSize: MyFonts.buttonTextSize,
              fontWeight: FontWeight.w800,
              color: LightThemeColors.blueTextColor,
            ),
          ),
          onPressed: widget.onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.prefixIcon != null) widget.prefixIcon as Widget,
              if (widget.prefixIcon != null)
                SizedBox(
                  width: context.width * 0.02,
                ),
              Visibility(
                visible: widget.buttonTextExpand,
                replacement: CustomWhiteText(
                  text: widget.buttonText,
                  fontWeight: FontWeight.w600,
                ),
                child: Expanded(
                  child: CustomWhiteText(
                    text: widget.buttonText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.width,
    this.onPressed,
    this.prefixIcon,
    this.height = 58,
    this.fontSize = 16,
    this.borderRadius = 4,
    this.buttonText = "Sign up",
    this.buttonTextExpand = false,
  });

  final Widget? prefixIcon;
  final double height;
  final double? width;
  final double fontSize;
  final double borderRadius;
  final String buttonText;
  final Function()? onPressed;
  final bool buttonTextExpand;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: buttonText,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: LightThemeColors.blueTextColor, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius,
              ),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null) prefixIcon as Widget,
              if (prefixIcon != null)
                SizedBox(
                  width: context.width * 0.02,
                ),
              Visibility(
                visible: buttonTextExpand,
                replacement: CustomBlueText(
                  text: buttonText,
                  fontWeight: FontWeight.w600,
                ),
                child: Expanded(
                  child: CustomBlueText(
                    text: buttonText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
