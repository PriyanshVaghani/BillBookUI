import 'package:bill_book_ui/widgets/select_item_category_sheet.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class SelectCategoryButtonWidget extends StatefulWidget {
  const SelectCategoryButtonWidget({super.key});

  @override
  State<SelectCategoryButtonWidget> createState() =>
      _SelectCategoryButtonWidgetState();
}

class _SelectCategoryButtonWidgetState
    extends State<SelectCategoryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SelectItemCategorySheet(
                passContext: context,
              );
            },
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: ColorCode.colorGrey.withOpacity(0.3),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: ColorCode.colorBlack,
        ),
        label: Text(
          "Select Category",
          style: TextStyle(
            color: ColorCode.colorBlack,
          ),
        ),
      ),
    );
  }
}
