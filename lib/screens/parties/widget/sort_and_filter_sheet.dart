import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:flutter/material.dart';

class SortAndFilterSheet extends StatefulWidget {
  const SortAndFilterSheet({super.key});

  @override
  State<SortAndFilterSheet> createState() => _SortAndFilterSheetState();
}

class _SortAndFilterSheetState extends State<SortAndFilterSheet> {
  int selectedSortOption =
      -1; // it for index of sort option select from sortOption list, default -1 for all
  List<String> sortOption = [
    "Party Name - A to Z",
    "Party Name - Z to A",
    "Amount - High to Low",
    "Amount - Low to High",
  ];
  int selectedFilterOption =
      -1; // it for index of filter option select from filterOption list, default -1 for all
  List<String> filterOption = [
    "New Customer",
    "Old Customer",
    "Active Customer",
    "Inactive Customer",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: BuildBottomSheetTitleWidget(title: "Sort and Filter"),
        ),
        Container(
          color: ColorCode.colorPrimaryColor.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sort By",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorCode.colorBlack.withOpacity(0.5),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedSortOption = -1;
                  });
                },
                child: const Text("CLEAR"),
              ),
            ],
          ),
        ),
        ...sortOption.map((e) => buildRadioButton(e, sortOption.indexOf(e))),
        Container(
          color: ColorCode.colorPrimaryColor.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter By",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorCode.colorBlack.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 16,
            children: filterOption
                .map((e) => buildFilterChipButton(e, filterOption.indexOf(e)))
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Apply",
              style: TextStyle(color: ColorCode.colorWhite),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFilterChipButton(String title, int value) {
    bool isSelected = selectedFilterOption == value;
    return InputChip(
      showCheckmark: false,
      label: Text(
        title,
        style: TextStyle(
          color:
              isSelected ? ColorCode.colorPrimaryColor : ColorCode.colorBlack,
        ),
      ),
      selected: isSelected,
      shape: StadiumBorder(
        side: BorderSide(
            color: ColorCode.colorPrimaryColor, width: isSelected ? 1.5 : 0),
      ),
      selectedColor: ColorCode.colorPrimaryColor.withOpacity(0.2),
      onPressed: () {
        setState(() {
          selectedFilterOption = value;
        });
      },
      deleteIconColor: ColorCode.colorPrimaryColor,
      onDeleted: isSelected
          ? () {
              setState(() {
                selectedFilterOption = -1;
              });
            }
          : null,
    );
  }

  Widget buildRadioButton(String title, int value) {
    return RadioListTile(
      value: value,
      groupValue: selectedSortOption,
      onChanged: (value) {
        setState(() {
          selectedSortOption = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(title),
      secondary: Icon(
        Icons.sort_by_alpha,
        color: ColorCode.colorPrimaryColor,
      ),
    );
  }
}
