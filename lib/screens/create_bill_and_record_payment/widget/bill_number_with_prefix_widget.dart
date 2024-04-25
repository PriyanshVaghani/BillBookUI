import 'package:bill_book_ui/screens/create_bill_and_record_payment/record_payment/widget/edit_received_payment_date_and_number_sheet.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class BillNumberWithPrefixWidget extends StatefulWidget {
  const BillNumberWithPrefixWidget({super.key, required this.setState});

  final Function setState;

  @override
  State<BillNumberWithPrefixWidget> createState() =>
      _BillNumberWithPrefixWidgetState();
}

class _BillNumberWithPrefixWidgetState
    extends State<BillNumberWithPrefixWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: buildTextFormFieldTitle("PreFix")),
            const SizedBox(width: 10),
            Expanded(child: buildTextFormFieldTitle("Starting Serial Number")),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: buildTextFormField(
                  textEditingController: TextEditingController(text: "BN/PI")),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: buildTextFormField(
                  textEditingController: TextEditingController(text: "1")),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {
                isAddPrefix = false;
                widget.setState();
              },
              icon: Icon(Icons.cancel, color: ColorCode.colorPrimaryColor),
              label: Text(
                "Remove Prefix",
                style: TextStyle(color: ColorCode.colorPrimaryColor),
              ),
            ),
            Text(
              "(Ex: BN/PI/1, BN/PI/2...)",
              style: TextStyle(color: ColorCode.colorGrey),
            ),
          ],
        ),
      ],
    );
  }
}
