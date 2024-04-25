import 'package:bill_book_ui/screens/create_bill_and_record_payment/record_payment/widget/edit_received_payment_date_and_number_sheet.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/utility/theme.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class BillNumberWithoutPrefixWidget extends StatefulWidget {
  const BillNumberWithoutPrefixWidget({super.key, required this.setState});

  final Function setState;

  @override
  State<BillNumberWithoutPrefixWidget> createState() =>
      _BillNumberWithoutPrefixWidgetState();
}

class _BillNumberWithoutPrefixWidgetState
    extends State<BillNumberWithoutPrefixWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextFormFieldTitle("Received Payment Number"),
        TextField(
          cursorColor: ColorCode.colorPrimaryColor,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
            border: outlineInputBorder,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorCode.colorPrimaryColor,
                width: 2,
              ),
            ),
            isDense: true,
          ),
        ),
        TextButton.icon(
          onPressed: () {
            isAddPrefix = true;
            widget.setState();
          },
          icon: Icon(Icons.add, color: ColorCode.colorPrimaryColor),
          label: Text(
            "Add Prefix",
            style: TextStyle(color: ColorCode.colorPrimaryColor),
          ),
        ),
      ],
    );
  }
}
