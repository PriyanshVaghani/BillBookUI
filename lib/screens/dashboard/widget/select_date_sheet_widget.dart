import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:flutter/material.dart';

class SelectDateSheetWidget extends StatefulWidget {
  const SelectDateSheetWidget({super.key});

  @override
  State<SelectDateSheetWidget> createState() => _SelectDateSheetWidgetState();
}

class _SelectDateSheetWidgetState extends State<SelectDateSheetWidget> {
  int selectedDateIndex =
      0; // it is for store index of selected date from dateOption list
  List<String> dateOption = [
    "Today",
    "Yesterday",
    "This Week",
    "Last Week",
    "Last 7 Days",
    "This Month",
    "Last Month",
    "This quarter",
    "Last quarter",
    "Current fiscal Year",
    "Previous fiscal Year",
    "Last 365 Days",
    "Custom",
  ];

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: _startDate ?? DateTime.now(),
      end: _endDate ?? DateTime.now(),
    );

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialDateRange: initialDateRange,
    );

    if (newDateRange != null) {
      setState(() {
        _startDate = newDateRange.start;
        _endDate = newDateRange.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BuildBottomSheetTitleWidget(title: "Select Date"),
          Expanded(
            child: ListView.builder(
              itemCount: dateOption.length,
              itemBuilder: (context, index) {
                return Card(
                  child: RadioListTile(
                    value: index,
                    groupValue: selectedDateIndex,
                    onChanged: (value) async {
                      selectedDateIndex = value!;
                      setState(() {});
                      switch (index) {
                        case 12:
                          await _selectDateRange(context);
                          break;
                        default:
                          break;
                      }
                      // Navigator.pop(context);
                      navigator.pop();
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(dateOption[index]),
                    subtitle: const Text("01 Apr 2024 - 01 Apr 2024"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
