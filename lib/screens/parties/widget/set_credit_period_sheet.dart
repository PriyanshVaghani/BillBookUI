import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class SetCreditPeriodSheet extends StatefulWidget {
  const SetCreditPeriodSheet({super.key});

  @override
  State<SetCreditPeriodSheet> createState() => _SetCreditPeriodSheetState();
}

class _SetCreditPeriodSheetState extends State<SetCreditPeriodSheet> {
  Map<int, String> creditPeriod = {
    0: "7 Days",
    1: "15 Days",
    2: "30 Days",
    3: "45 Days",
    4: "60 Days",
    5: "90 Days",
    6: "Custom",
  };
  int selectedCreditPeriod = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: BuildBottomSheetTitleWidget(title: "Set Credit Period"),
            ),
            ...creditPeriod.entries.map((entry) {
              return RadioListTile<int>(
                title: Text(entry.value),
                value: entry.key,
                groupValue: selectedCreditPeriod,
                onChanged: (value) {
                  setState(() {
                    selectedCreditPeriod = value!;
                  });
                },
              );
            }).toList(),
            selectedCreditPeriod == 6
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextFormFieldTitle("Custom Credit Period"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: buildTextFormField(
                            suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Day(s)",
                            style: TextStyle(
                                fontSize: 18, color: ColorCode.colorGrey),
                          ),
                        )),
                      )
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleFloatingButtonWidget(
                  onPressed: () {}, buttonTitle: "Save"),
            ),
          ],
        ),
      ),
    );
  }
}
