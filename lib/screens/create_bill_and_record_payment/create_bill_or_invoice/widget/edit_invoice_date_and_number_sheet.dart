import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class EditInvoiceDateAndNumberSheet extends StatefulWidget {
  const EditInvoiceDateAndNumberSheet({super.key});

  @override
  State<EditInvoiceDateAndNumberSheet> createState() =>
      _EditInvoiceDateAndNumberSheetState();
}

class _EditInvoiceDateAndNumberSheetState
    extends State<EditInvoiceDateAndNumberSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 8,
        right: 8,
        top: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuildBottomSheetTitleWidget(
              title: "Edit Invoice Date & Number"),
          buildTextFormFieldTitle("Invoice Date"),
          buildTextFormField(
            textEditingController: TextEditingController(text: "17 Apr 2024"),
            isEnabled: false,
            suffixIcon: Icon(
              Icons.calendar_month,
              color: ColorCode.colorBlack,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
