import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_template_get_x/config/config.dart';
import 'package:starter_template_get_x/data/data.dart';
import 'package:starter_template_get_x/presentation/presentation.dart';

class CustomExamplesPage extends StatefulWidget {
  const CustomExamplesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomExamplesPageState();
  }
}

class _CustomExamplesPageState extends State<CustomExamplesPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("inside custom exp page");
    return CustomScaffold(
      selectedDrawerElement: DrawerElements.projects,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black12,
              ),
            );
          },
        ),
        title: const Text(
          "My Dashboard",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Button Samples",
              fontSize: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PrimaryButton(
                  buttonText: "Add User",
                  prefixIcon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    CustomDialog.customDialog(
                      buttonWidth: context.width * 0.3,
                      title: "Export Project",
                      message: "The project report will be emailed you shortly",
                      iconWidget: Assets.svg.fileIcon.svg(),
                      onSuccess: () {
                        Get.back();
                      },
                      onCancel: () {
                        Get.back();
                      },
                    );
                  },
                ),
                const SecondaryButton(
                  buttonText: "  Export  ",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Payment integration examples",
              fontSize: 28,
            ),
            PrimaryButton(
              buttonText: "Payment Example Page",
              onPressed: () {
                Get.toNamed(Routes.examplePayment);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Text Field Sample",
              fontSize: 28,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(controller: TextEditingController())),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Drop down sample",
              fontSize: 28,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: CustomDropdown(
                items: const [
                  "Option 1 Option 1 Option 1 Option 1 Option 1 Option 1 Option 1 Option 1 Option 1 Option 1 Option 1 ",
                  "Option 2",
                  "Option 3",
                  "Option 4",
                  "Option 5",
                  "Option 6",
                  "Option 7",
                  "Option 8",
                  "Option 9",
                  "Option 10",
                  "Option 11",
                  "Option 12",
                ],
                hintText: "Search..",
                hideIcon: false,
                dropDownMenuMaxHeight: 250,
                dropDownWidthPercentage: 1,
                onChange: (value) {
                  print(value);
                },
                // selectedValue: 'Option 1',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Multiselect Dropdown sample",
              fontSize: 28,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomMultiSelectDropdown(
                items: const [
                  "Option 1",
                  "Option 2",
                  "Option 3",
                  "Option 4",
                  "Option 5",
                  "Option 6",
                  "Option 7",
                  "Option 8",
                  "Option 9",
                  "Option 10",
                  "Option 11",
                  "Option 12",
                ],
                hintText: "Search..",
                hideIcon: false,
                dropDownMenuMaxHeight: 250,
                dropDownWidthPercentage: 1,
                onChange: (value) {
                  print(value);
                },
                selectedItems: ["Option 1", "Option 12"],
                // selectedValue: 'Option 1',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Search Dropdown sample",
              fontSize: 28,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomSearchDropdown(
                items: const [
                  "Vikrant Patil",
                  "Sahil Khan",
                  "Thevar Sharma",
                  "Mayur Patil",
                  "Megha Gavankar",
                  "Vaibhav Ghadge",
                  "Omkar Patil",
                  "Ashiwini Patil",
                ],
                hintText: "Search..",
                hideIcon: false,
                dropDownMenuMaxHeight: 350,
                dropDownWidthPercentage: 1,
                onChange: (value) {
                  print(value);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Text Samples",
              fontSize: 28,
            ),
            const CustomText(
                text: "The Willows Newsletter Issue 1 -  Volume 6"),
            const CustomNobelText(
                text: "The Willows Newsletter Issue 1 -  Volume 6"),
            const CustomWhiteText(
                text: "The Willows Newsletter Issue 1 -  Volume 6"),
            const CustomBlueText(
                text: "The Willows Newsletter Issue 1 -  Volume 6"),
            const CustomRhinoText(
                text: "The Willows Newsletter Issue 1 -  Volume 6"),
            const CustomWildBlueText(
                text: "The Willows Newsletter Issue 1 -  Volume 6"),
          ],
        ),
      ),
    );
  }
}
