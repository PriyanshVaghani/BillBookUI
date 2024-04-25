import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/select_item_category_sheet.dart';
import 'package:flutter/material.dart';

class CategoryChipWidget extends StatefulWidget {
  const CategoryChipWidget({super.key});

  @override
  State<CategoryChipWidget> createState() => _CategoryChipWidgetState();
}

class _CategoryChipWidgetState extends State<CategoryChipWidget> {
  bool isCategory = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Category",
            style: TextStyle(
              color: isCategory
                  ? ColorCode.colorPrimaryColor
                  : ColorCode.colorBlack,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
      selected: isCategory,
      onSelected: (bool value) {
        if (value) {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SelectItemCategorySheet(passContext: context),
          );
        }
        setState(() {
          isCategory = value;
        });
      },
      backgroundColor: ColorCode.colorWhite,
      selectedColor: ColorCode.colorPrimaryColor.withOpacity(0.2),
      shape: StadiumBorder(
        side: BorderSide(
          color: ColorCode.colorPrimaryColor,
          width: isCategory ? 1.5 : 0,
        ),
      ),
    );
  }
}
