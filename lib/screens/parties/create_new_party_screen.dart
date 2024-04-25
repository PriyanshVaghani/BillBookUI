import 'package:bill_book_ui/screens/parties/widget/create_party_info_tabbar_screen.dart';
import 'package:bill_book_ui/widgets/choice_chip_widget.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class CreateNewPartyScreen extends StatefulWidget {
  const CreateNewPartyScreen({super.key});

  @override
  State<CreateNewPartyScreen> createState() => _CreateNewPartyScreenState();
}

class _CreateNewPartyScreenState extends State<CreateNewPartyScreen> {
  int isPartyTypeCustomer =
      0; // type of party 0 means Customer and 1 for Supplier

  void _onPartyTypeSelected(int index) {
    setState(() {
      isPartyTypeCustomer = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Create New Party"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextFormFieldTitle("Party Name"),
                  buildTextFormField(hintText: "Ex: Ankit Mishra"),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTextFormFieldTitle("Contact Number"),
                            const SizedBox(height: 4),
                            buildTextFormField(
                              hintText: "Ex: 9874563210",
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextFormFieldTitle("Party Type"),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              // customer chip
                              buildChoiceChip(
                                index: 0,
                                onTap: _onPartyTypeSelected,
                                selectedIndex: isPartyTypeCustomer,
                                title: "Customer",
                              ),
                              const SizedBox(width: 4),
                              // supplier chip
                              buildChoiceChip(
                                index: 1,
                                onTap: _onPartyTypeSelected,
                                selectedIndex: isPartyTypeCustomer,
                                title: "Supplier",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const Divider(),
            // tab bar
            const CreatePartyInfoTabBarScreen(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SingleFloatingButtonWidget(
          onPressed: () {},
          buttonTitle: "Save",
        ),
      ),
    );
  }
}
