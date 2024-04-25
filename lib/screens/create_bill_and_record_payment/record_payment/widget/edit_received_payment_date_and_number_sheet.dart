import 'package:bill_book_ui/screens/create_bill_and_record_payment/widget/bill_number_with_prefix_widget.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/widget/bill_number_without_prefix_widget.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

bool isAddPrefix = false;

class EditReceivedPaymentDateAndNumberSheet extends StatefulWidget {
  const EditReceivedPaymentDateAndNumberSheet({super.key});

  @override
  State<EditReceivedPaymentDateAndNumberSheet> createState() =>
      _EditReceivedPaymentDateAndNumberSheetState();
}

class _EditReceivedPaymentDateAndNumberSheetState
    extends State<EditReceivedPaymentDateAndNumberSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 12,
        right: 12,
        top: 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuildBottomSheetTitleWidget(
              title: "Edit Received Payment Date & Number"),
          const SizedBox(height: 16),
          buildTextFormFieldTitle("Received Payment Date"),
          buildTextFormField(
            textEditingController: TextEditingController(text: "17 Apr 2024"),
            isEnabled: false,
            suffixIcon: Icon(
              Icons.calendar_month,
              color: ColorCode.colorBlack,
            ),
          ),
          const SizedBox(height: 10),
          isAddPrefix
              ?
              // If user want to add prefix
              BillNumberWithPrefixWidget(
                  setState: () {
                    setState(() {});
                  },
                )
              : BillNumberWithoutPrefixWidget(
                  setState: () {
                    setState(() {});
                  },
                ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {},
              child: Text(
                "SAVE",
                style: TextStyle(color: ColorCode.colorWhite),
              ),
            ),
          )
        ],
      ),
    );
  }
}
