import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:starter_template_get_x/config/config.dart';
import 'package:starter_template_get_x/presentation/presentation.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.selectedValue,
    required this.items,
    this.hideIcon = false,
    this.hintText = "Select..",
    required this.onChange,
    this.dropDownWidthPercentage = 0.5,
    this.dropDownMenuMaxHeight = 250,
    this.dropDownMenuWidth = 300,
    this.iconSize = 10,
  });

  final String hintText;
  final dynamic selectedValue;
  final List<dynamic> items;
  final bool hideIcon;
  final Function(dynamic) onChange;
  final double dropDownWidthPercentage;
  final double dropDownMenuWidth;
  final double dropDownMenuMaxHeight;
  final double iconSize;

  @override
  State<StatefulWidget> createState() {
    return _CustomDropDownState();
  }
}

class _CustomDropDownState extends State<CustomDropdown> {
  dynamic value;

  @override
  void initState() {
    if (widget.selectedValue != null) {
      value = widget.selectedValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: widget.items.map(
          (itemValue) {
            return DropdownMenuItem(
              value: itemValue,
              child: CustomText(
                text: itemValue as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ).toList(),
        value: value,
        onChanged: (chosenValue) {
          setState(() {
            value = chosenValue;
          });
          widget.onChange(chosenValue);
        },
        hint: CustomWildBlueText(
          text: widget.hintText,
        ),
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          width: context.width * widget.dropDownWidthPercentage,
          height: 56,
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: ColorName.lavenderMist,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Assets.images.icons.downArrow.image(
            height: widget.hideIcon ? 0 : widget.iconSize,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: widget.dropDownMenuMaxHeight,
          width: widget.dropDownMenuWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all(6),
            thumbVisibility: WidgetStateProperty.all(true),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDropdown extends StatefulWidget {
  const CustomSearchDropdown({
    super.key,
    this.selectedValue,
    required this.items,
    this.hideIcon = false,
    this.hintText = "Select..",
    required this.onChange,
    this.dropDownWidthPercentage = 0.5,
    this.dropDownMenuMaxHeight = 300,
    this.dropDownMenuWidth = 300,
    this.iconSize = 10,
  });

  final String hintText;
  final dynamic selectedValue;
  final List<dynamic> items;
  final bool hideIcon;
  final Function(dynamic) onChange;
  final double dropDownWidthPercentage;
  final double dropDownMenuWidth;
  final double dropDownMenuMaxHeight;
  final double iconSize;

  @override
  State<StatefulWidget> createState() {
    return _CustomSearchDropdownState();
  }
}

class _CustomSearchDropdownState extends State<CustomSearchDropdown> {
  dynamic value;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.selectedValue != null) {
      value = widget.selectedValue!;
    }
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: widget.items.map(
          (itemValue) {
            return DropdownMenuItem(
              value: itemValue,
              child: CustomText(
                text: itemValue as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ).toList(),
        value: value,
        onChanged: (chosenValue) {
          setState(() {
            value = chosenValue;
          });
          widget.onChange(chosenValue);
        },
        hint: CustomWildBlueText(
          text: widget.hintText,
        ),
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          width: context.width * widget.dropDownWidthPercentage,
          height: 56,
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: ColorName.lavenderMist,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Assets.images.icons.downArrow.image(
            height: widget.hideIcon ? 0 : widget.iconSize,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: widget.dropDownMenuMaxHeight,
          width: widget.dropDownMenuWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all(6),
            thumbVisibility: WidgetStateProperty.all(true),
          ),
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 56,
          searchInnerWidget: Container(
            padding: const EdgeInsets.only(
              top: 8,
              right: 8,
              left: 8,
            ),
            child: CustomTextField(
              controller: textEditingController,
              hint: "Search for an item",
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value.toString().contains(searchValue);
          },
        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}

class CustomMultiSelectDropdown extends StatefulWidget {
  const CustomMultiSelectDropdown({
    super.key,
    this.selectedValue,
    required this.items,
    this.hideIcon = false,
    this.hintText = "Select..",
    required this.onChange,
    this.dropDownWidthPercentage = 0.5,
    this.dropDownMenuMaxHeight = 250,
    this.dropDownMenuWidth = 300,
    this.selectedItems = const [],
    this.iconSize = 10,
  });

  final String hintText;
  final dynamic selectedValue;
  final List<dynamic> items;
  final bool hideIcon;
  final Function(dynamic) onChange;
  final double dropDownWidthPercentage;
  final double dropDownMenuWidth;
  final double dropDownMenuMaxHeight;
  final List<dynamic> selectedItems;
  final double iconSize;

  @override
  State<StatefulWidget> createState() {
    return _CustomMultiSelectDropdownState();
  }
}

class _CustomMultiSelectDropdownState extends State<CustomMultiSelectDropdown> {
  List<dynamic> selectedItems = [];

  @override
  void initState() {
    selectedItems = widget.selectedItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: widget.items.map(
          (item) {
            return DropdownMenuItem(
              value: item,
              //disable default onTap to avoid closing menu when selecting an item
              enabled: false,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      isSelected
                          ? selectedItems.remove(item)
                          : selectedItems.add(item);
                      widget.onChange(selectedItems);
                      //This rebuilds the StatefulWidget to update the button's text
                      setState(() {});
                      //This rebuilds the dropdownMenu Widget to update the check mark
                      menuSetState(() {});
                    },
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          if (isSelected)
                            const Icon(
                              Icons.check_box_outlined,
                              color: ColorName.metallicSilver,
                            )
                          else
                            const Icon(
                              Icons.check_box_outline_blank,
                              color: ColorName.lavenderMist,
                            ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomText(
                              text: item,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ).toList(),
        value: selectedItems.isEmpty ? null : selectedItems.last,
        onChanged: (chosenValue) {
          print("choose value");
        },
        selectedItemBuilder: (context) {
          return widget.items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.centerStart,
                child: CustomText(
                  text: selectedItems.join(', '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ).toList();
        },
        hint: CustomWildBlueText(
          text: widget.hintText,
        ),
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          width: context.width * widget.dropDownWidthPercentage,
          height: 56,
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: ColorName.lavenderMist,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Assets.images.icons.downArrow.image(
            height: widget.hideIcon ? 0 : widget.iconSize,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: widget.dropDownMenuMaxHeight,
          width: widget.dropDownMenuWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all(6),
            thumbVisibility: WidgetStateProperty.all(true),
          ),
        ),
      ),
    );
  }
}

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget({
    super.key,
    this.selectedValue,
    required this.items,
    this.hideIcon = false,
    this.hintText = "Select",
  });

  final String hintText;
  final dynamic selectedValue;
  final List<dynamic> items;
  final bool hideIcon;

  @override
  State<StatefulWidget> createState() {
    return _CustomDropdownWidgetState();
  }
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  dynamic value;

  @override
  void initState() {
    if (widget.selectedValue != null) {
      value = widget.selectedValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ColorName.lavenderMist,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: const EdgeInsets.only(left: 16, right: 16),
          items: widget.items.map(
            (itemValue) {
              return DropdownMenuItem(
                value: itemValue,
                child: CustomText(text: itemValue as String),
              );
            },
          ).toList(),
          value: value,
          onChanged: (chosenValue) {
            setState(() {
              value = chosenValue!;
            });
          },
          hint: CustomWildBlueText(
            text: widget.hintText,
          ),
          isExpanded: true,
          icon: Assets.images.icons.downArrow.image(
            height: 16,
          ),
          iconSize: widget.hideIcon ? 0 : 24,
          selectedItemBuilder: (context) {
            return widget.items.map(
              (itemValue) {
                return Text(itemValue as String);
              },
            ).toList();
          },
          onTap: () {
            print("onTap");
          },
        ),
      ),
    );
  }
}
