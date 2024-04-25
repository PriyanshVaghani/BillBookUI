import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:flutter/material.dart';

class SortOptionSheetWidget extends StatefulWidget {
  const SortOptionSheetWidget({super.key});

  @override
  State<SortOptionSheetWidget> createState() => _SortOptionSheetWidgetState();
}

class _SortOptionSheetWidgetState extends State<SortOptionSheetWidget> {
  int selectedSorted = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: BuildBottomSheetTitleWidget(title: "Sort & Filter"),
          ),
          Container(
            color: ColorCode.colorPrimaryColor.withOpacity(0.1),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sort By",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "CLEAR",
                    style: TextStyle(
                        fontSize: 18, color: ColorCode.colorPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
          radioButton("Amount - Low to High", 1),
          const Divider(),
          radioButton("Amount - High to Low", 2),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: double.maxFinite,
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {},
              child: Text(
                "Apply",
                style: TextStyle(color: ColorCode.colorWhite, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget radioButton(String title, int value) {
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      value: value,
      dense: true,
      groupValue: selectedSorted,
      onChanged: (value) {
        setState(() {
          selectedSorted = value!;
        });
      },
      secondary: const Icon(Icons.sort),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
