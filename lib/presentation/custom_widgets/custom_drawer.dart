import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:starter_template_get_x/config/config.dart';
import 'package:starter_template_get_x/data/data.dart';
import 'package:starter_template_get_x/presentation/custom_widgets/custom_text_widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    this.selectDrawerElement,
  });

  final DrawerElements? selectDrawerElement;

  @override
  Widget build(BuildContext context) {
    List<DrawerItem> drawerList = [
      DrawerItem(
        name: "Dashboard",
        identifier: DrawerElements.dashboard,
        selected: false,
        notSelectedPrefixIcon: Assets.images.icons.homeIcon.image(
          height: 24,
        ),
        selectedPrefixIcon: Assets.images.icons.homeIcon.image(
          height: 24,
          color: ColorName.blue,
        ),
      ),
      DrawerItem(
        name: "Projects",
        identifier: DrawerElements.projects,
        selected: false,
        notSelectedPrefixIcon: Assets.images.icons.homeIcon.image(
          height: 24,
        ),
        selectedPrefixIcon: Assets.images.icons.homeIcon.image(
          height: 24,
          color: ColorName.blue,
        ),
      ),
      DrawerItem(
        name: "Tasks",
        identifier: DrawerElements.tasks,
        selected: false,
        notSelectedPrefixIcon: Assets.images.icons.homeIcon.image(
          height: 24,
        ),
        selectedPrefixIcon: Assets.images.icons.homeIcon.image(
          height: 24,
          color: ColorName.blue,
        ),
      ),
      DrawerItem(
        name: "Forms",
        identifier: DrawerElements.forms,
        selected: false,
        notSelectedPrefixIcon: Assets.images.icons.homeIcon.image(
          height: 24,
        ),
        selectedPrefixIcon: Assets.images.icons.homeIcon.image(
          height: 24,
          color: ColorName.blue,
        ),
      ),
    ];

    for (DrawerItem item in drawerList) {
      if (selectDrawerElement != null &&
          item.identifier == selectDrawerElement) {
        item.selected = true;
      }
    }

    return Container(
      color: Colors.white,
      width: context.width * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: context.height * 0.05,
          ),
          Assets.logo.appIconWebp.image(
            height: 80,
          ),
          SizedBox(
            height: context.height * 0.03,
          ),
          Column(
            children: drawerList.map<Widget>(
              (drawerItem) {
                return DrawerListTile(
                  drawerItem: drawerItem,
                );
              },
            ).toList(),
          ),
          const Spacer(),
          DrawerListTile(
            drawerItem: DrawerItem(
              name: "Settings",
              identifier: DrawerElements.settings,
              selected: selectDrawerElement == DrawerElements.settings,
              notSelectedPrefixIcon: const Icon(
                Icons.settings,
                color: ColorName.nobel,
              ),
              selectedPrefixIcon: const Icon(
                Icons.settings,
              ),
            ),
          ),
          DrawerListTile(
            drawerItem: DrawerItem(
              name: "Log Out",
              identifier: DrawerElements.projects,
              selected: false,
              notSelectedPrefixIcon: const Icon(
                Icons.logout,
                color: ColorName.nobel,
              ),
              selectedPrefixIcon: const Icon(
                Icons.logout,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.drawerItem,
  });

  final DrawerItem drawerItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: drawerItem.selected
          ? drawerItem.selectedPrefixIcon
          : drawerItem.notSelectedPrefixIcon,
      title: drawerItem.selected
          ? CustomBlueText(
              text: drawerItem.name,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )
          : CustomNobelText(
              text: drawerItem.name,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
      onTap: () {
        print("On tap");
        // TODO: Implement Redirection logic
      },
    );
  }
}
