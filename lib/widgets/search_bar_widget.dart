import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

Widget buildIsSearchTrue(VoidCallback setIsSearch) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        onPressed: setIsSearch,
        icon: Icon(
          Icons.arrow_back,
          color: ColorCode.colorPrimaryColor,
        ),
      ),
      Expanded(
        child: buildTextFormField(
          hintText: "Search party by name",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    ],
  );
}

Widget buildIsSearchFalse(VoidCallback setIsSearch) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text("Items"),
      IconButton(
        onPressed: setIsSearch,
        icon: Icon(
          Icons.search,
          color: ColorCode.colorPrimaryColor,
        ),
      ),
    ],
  );
}
