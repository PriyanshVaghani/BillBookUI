import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/item_list_screen.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/widget/edit_invoice_date_and_number_sheet.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/record_payment/widget/party_name_widget.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class CreateBillOrInvoiceScreen extends StatefulWidget {
  const CreateBillOrInvoiceScreen({super.key});

  @override
  State<CreateBillOrInvoiceScreen> createState() =>
      _CreateBillOrInvoiceScreenState();
}

class _CreateBillOrInvoiceScreenState extends State<CreateBillOrInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCode.colorWhite.withOpacity(0.9),
        appBar: AppBar(
          title: const Text("Create Bill / Invoice"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
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
                              return const EditInvoiceDateAndNumberSheet();
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
              const PartyNameWidget(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: ColorCode.colorWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "ITEMS",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemListScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorCode.colorPrimaryColor.withOpacity(0.1),
                      ),
                      child: Text(
                        "Add Items",
                        style: TextStyle(
                            color: ColorCode.colorPrimaryColor, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
