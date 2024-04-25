import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/utility/theme.dart';
import 'package:flutter/material.dart';

// this for create title above the text form filed
Widget buildTextFormFieldTitle(String text) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w600,
      color: ColorCode.colorBlack.withOpacity(0.65),
    ),
  );
}

// this create a text form filed
Widget buildTextFormField({
  String hintText = "",
  Widget prefixIcon = const SizedBox(),
  Widget suffixIcon = const SizedBox(),
  TextEditingController? textEditingController,
  TextInputType keyboardType = TextInputType.text,
  bool isEnabled = true, // this for required false want we want to display date
  int maxLines = 1,
}) {
  return TextFormField(
    controller: textEditingController,
    cursorColor: ColorCode.colorPrimaryColor,
    keyboardType: keyboardType,
    enabled: isEnabled,
    style: TextStyle(color: ColorCode.colorBlack),
    maxLines: maxLines,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      hintText: hintText,
      hintStyle: TextStyle(color: ColorCode.colorGrey),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
      isDense: true,
    ),
  );
}
