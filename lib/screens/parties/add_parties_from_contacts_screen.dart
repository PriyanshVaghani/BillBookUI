import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:flutter/material.dart';

class AddPartiesFromContactsScreen extends StatefulWidget {
  const AddPartiesFromContactsScreen({super.key});

  @override
  State<AddPartiesFromContactsScreen> createState() =>
      _AddPartiesFromContactsScreenState();
}

class _AddPartiesFromContactsScreenState
    extends State<AddPartiesFromContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Parties From Contacts"),
        ),
        body: Container(
          color: ColorCode.colorPrimaryColor.withOpacity(0.1),
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.maxFinite,
                color: ColorCode.colorWhite,
                child: const Column(
                  children: [
                    Text(
                      "Select contacts & create multiple Parties!",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text(
                      "For quicker and easier experience of creating sales invoices",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: ListTile(
                        title: const Text("Customer"),
                        subtitle: const Text("0 contacts selected"),
                        trailing: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height - 48,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Column(
                                    children: [
                                      const BuildBottomSheetTitleWidget(
                                          title: "Select Customer"),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            border: UnderlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            fillColor: ColorCode.colorGrey
                                                .withOpacity(0.2),
                                            prefixIcon:
                                                const Icon(Icons.search),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return CheckboxListTile(
                                              value: false,
                                              onChanged: (value) {},
                                              title: const Text("Name"),
                                              subtitle:
                                                  const Text("9874563210"),
                                            );
                                          },
                                        ),
                                      ),
                                      const SingleFloatingButtonWidget(
                                        buttonTitle: "Select Contacts",
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Select"),
                              Icon(
                                Icons.arrow_forward,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
            const SingleFloatingButtonWidget(buttonTitle: "Create Parties"),
      ),
    );
  }
}
