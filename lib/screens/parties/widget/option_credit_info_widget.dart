import 'package:bill_book_ui/screens/parties/widget/set_credit_period_sheet.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/choice_chip_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class OptionCreditInfoWidget extends StatefulWidget {
  const OptionCreditInfoWidget({super.key});

  @override
  State<OptionCreditInfoWidget> createState() => _OptionCreditInfoWidgetState();
}

class _OptionCreditInfoWidgetState extends State<OptionCreditInfoWidget> {
  // 0 for I Receive and 1 for I Pay
  int isIReceiveOrPay = 0;

  void _onIReceiveOrPaySelected(int index) {
    setState(() {
      isIReceiveOrPay = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: ColorCode.colorWhite,
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextFormFieldTitle("Opening Balance"),
              Row(
                children: [
                  Expanded(
                    child: buildTextFormField(
                      hintText: "0.0",
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(Icons.currency_rupee),
                    ),
                  ),
                  const SizedBox(width: 16),
                  buildChoiceChip(
                      title: "I receive",
                      index: 0,
                      selectedIndex: isIReceiveOrPay,
                      onTap: _onIReceiveOrPaySelected),
                  const SizedBox(width: 4),
                  buildChoiceChip(
                      title: "I pay",
                      index: 1,
                      selectedIndex: isIReceiveOrPay,
                      onTap: _onIReceiveOrPaySelected),
                ],
              ),
              const SizedBox(height: 16),
              buildTextFormFieldTitle("Credit Period(Days)"),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const SetCreditPeriodSheet();
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorCode.colorGrey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("7 Days"),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              buildTextFormFieldTitle("Credit Limit"),
              buildTextFormField(
                  hintText: "500.0",
                  prefixIcon: const Icon(Icons.currency_rupee)),
            ],
          ),
        ),
      ],
    );
  }
}
