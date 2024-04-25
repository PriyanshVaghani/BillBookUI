import 'package:bill_book_ui/screens/create_bill_and_record_payment/record_payment/widget/edit_received_payment_date_and_number_sheet.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/record_payment/widget/party_name_widget.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/choice_chip_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class RecordPaymentInScreen extends StatefulWidget {
  const RecordPaymentInScreen({super.key});

  @override
  State<RecordPaymentInScreen> createState() => _RecordPaymentInScreenState();
}

class _RecordPaymentInScreenState extends State<RecordPaymentInScreen> {
  int selectedPaymentMode =
      0; // it for select payment mode, 0 for cash and 1 for cheque and 2 for online
  Map<int, String> paymentModeType = {0: "Cash", 1: "Cheque", 2: "Online"};

  void _onSelectedPaymentMode(int index) {
    setState(() {
      selectedPaymentMode = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCode.colorWhite.withOpacity(0.9),
        appBar: AppBar(
          title: const Text("Record Payment In"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // date with record No.
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: ColorCode.colorWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Received Payment #2",
                          style: TextStyle(color: ColorCode.colorPrimaryColor),
                        ),
                        const Text("02 Apr 2024"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      width: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return const EditReceivedPaymentDateAndNumberSheet();
                            },
                          );
                        },
                        style:
                            OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "EDIT",
                          style: TextStyle(color: ColorCode.colorPrimaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Party name
              const PartyNameWidget(),

              // amount
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: ColorCode.colorWhite,
                child: Row(
                  children: [
                    const Text("AMOUNT"),
                    const SizedBox(width: 10),
                    Expanded(
                      child: buildTextFormField(
                        prefixIcon: Icon(
                          Icons.currency_rupee,
                          color: ColorCode.colorPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //payment mode
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                color: ColorCode.colorWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Payment Mode"),
                    const Spacer(),
                    ...paymentModeType.entries
                        .map(
                          (e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: buildChoiceChip(
                              selectedIndex: selectedPaymentMode,
                              onTap: _onSelectedPaymentMode,
                              index: e.key,
                              title: e.value,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              if (selectedPaymentMode != 0)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: ColorCode.colorWhite,
                  child: Row(
                    children: [
                      const Text(
                        "Select Bank Account",
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        "Account Name",
                        style: TextStyle(color: ColorCode.colorGrey),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorCode.colorPrimaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              buildTextIconButton(title: 'Note', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextIconButton(
      {required String title, required VoidCallback onPressed}) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: Text(title),
      ),
    );
  }
}
