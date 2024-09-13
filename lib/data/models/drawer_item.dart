import 'package:starter_template_get_x/data/data.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String name;
  DrawerElements identifier;
  bool selected;
  Widget notSelectedPrefixIcon;
  Widget selectedPrefixIcon;

  DrawerItem({
    required this.name,
    required this.identifier,
    required this.selected,
    required this.notSelectedPrefixIcon,
    required this.selectedPrefixIcon,
  });
}
