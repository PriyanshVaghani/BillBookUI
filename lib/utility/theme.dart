import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: ColorCode.colorBlack,
    ),
    elevation: 1,
    shadowColor: ColorCode.colorGrey,
    backgroundColor: ColorCode.colorWhite,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 18),
    // sheet title
    displayLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorCode.colorPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        textStyle: TextStyle(color: ColorCode.colorPrimaryColor),
        iconColor: ColorCode.colorPrimaryColor),
  ),
  iconTheme: IconThemeData(
    color: ColorCode.colorPrimaryColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorCode.colorPrimaryColor,
    shape: const StadiumBorder(),
    extendedTextStyle: TextStyle(color: ColorCode.colorWhite),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return ColorCode.colorPrimaryColor;
        }
        return ColorCode.colorGrey;
      },
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: ColorCode.colorWhite,
    selectedColor: ColorCode.colorPrimaryColor.withOpacity(0.1),
  ),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorColor: ColorCode.colorPrimaryColor,
    labelColor: ColorCode.colorPrimaryColor,
  ),
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: ColorCode.colorGrey),
);
