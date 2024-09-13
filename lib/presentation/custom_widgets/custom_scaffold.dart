import 'package:flutter/material.dart';

import 'package:starter_template_get_x/presentation/presentation.dart';
import 'package:starter_template_get_x/data/data.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.appBar,
    this.selectedDrawerElement,
    this.body,
    this.addSafeArea = false,
    this.top = true,
    this.bottom = true,
    this.right = true,
    this.left = true,
    this.enableDrawer = true,
  });

  final PreferredSizeWidget? appBar;
  final DrawerElements? selectedDrawerElement;
  final Widget? body;
  final bool addSafeArea;
  final bool enableDrawer;

  // NOTE: Only after addSafeArea is true following 4 parameters will work
  final bool top;
  final bool bottom;
  final bool right;
  final bool left;

  @override
  Widget build(BuildContext context) {
    if (addSafeArea) {
      return SafeArea(
        top: top,
        bottom: bottom,
        right: right,
        left: left,
        child: Scaffold(
          appBar: appBar,
          drawer: enableDrawer
              ? CustomDrawer(
                  selectDrawerElement: selectedDrawerElement,
                )
              : null,
          body: body,
        ),
      );
    } else {
      return Scaffold(
        appBar: appBar,
        drawer: enableDrawer
            ? CustomDrawer(
                selectDrawerElement: selectedDrawerElement,
              )
            : null,
        body: body,
      );
    }
  }
}
