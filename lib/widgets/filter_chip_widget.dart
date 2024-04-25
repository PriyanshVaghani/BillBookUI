import 'package:bill_book_ui/screens/parties/widget/sort_and_filter_sheet.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class FilterChipWidget extends StatefulWidget {
  const FilterChipWidget({super.key});

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool isFilter = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Filter",
            style: TextStyle(
              color:
                  isFilter ? ColorCode.colorPrimaryColor : ColorCode.colorBlack,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.filter_list),
        ],
      ),
      selected: isFilter,
      onSelected: (bool value) {
        if (value) {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => const SortAndFilterSheet(),
          );
        }
        setState(() {
          isFilter = value;
        });
      },
      backgroundColor: ColorCode.colorWhite,
      selectedColor: ColorCode.colorPrimaryColor.withOpacity(0.2),
      shape: StadiumBorder(
        side: BorderSide(
          color: ColorCode.colorPrimaryColor,
          width: isFilter ? 1.5 : 0,
        ),
      ),
    );
  }
}
