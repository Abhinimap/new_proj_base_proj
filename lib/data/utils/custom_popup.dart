import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starter_template_get_x/presentation/presentation.dart';
import 'package:starter_template_get_x/config/config.dart';

class CustomDialog {
  const CustomDialog._();

  static customDialog({
    required String title,
    required String message,
    Widget? iconWidget,
    Function()? onSuccess,
    Function()? onCancel,
    String buttonText = "Done",
    String cancelButtonText = "Cancel",
    double? buttonWidth,
    double buttonHeight = 50,
  }) {
    Get.dialog(StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          child: Container(
            height: context.height * 0.45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomRhinoText(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                const Divider(
                  color: ColorName.lavenderMist,
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                if (iconWidget != null) iconWidget,
                SizedBox(
                  height: context.height * 0.04,
                ),
                CustomText(
                  text: message,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: context.height * 0.04,
                ),
                const Divider(
                  color: ColorName.lavenderMist,
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SecondaryButton(
                      buttonText: cancelButtonText,
                      width: buttonWidth,
                      height: buttonHeight,
                      borderRadius: 9,
                      onPressed: () {
                        onCancel!();
                      },
                    ),
                    PrimaryButton(
                      width: buttonWidth,
                      height: buttonHeight,
                      borderRadius: 9,
                      onPressed: () {
                        onSuccess!();
                      },
                      buttonText: buttonText,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
