import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

// this is chip for to select one option from all chip

Widget buildChoiceChip(
    {required String title,
    required int index,
    required int selectedIndex,
    required Function(int) onTap}) {
  bool isSelected = selectedIndex == index; // chip is selected or not
  return ChoiceChip(
    label: Text(title),
    showCheckmark: false,
    selected: isSelected,
    shape: StadiumBorder(
      side: BorderSide(
        color: ColorCode.colorPrimaryColor,
        width: isSelected ? 1.5 : 0,
      ),
    ),
    onSelected: (bool value) {
      if (value) {
        onTap(index);
      }
    },
  );
}
