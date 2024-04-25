import 'package:bill_book_ui/screens/create_bill_and_record_payment/record_payment/widget/add_party_sheet.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class PartyNameWidget extends StatefulWidget {
  const PartyNameWidget({super.key});

  @override
  State<PartyNameWidget> createState() => _PartyNameWidgetState();
}

class _PartyNameWidgetState extends State<PartyNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8),
      color: ColorCode.colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("PARTY NAME"),
          buildTextFormField(
            prefixIcon: const Icon(Icons.person),
            hintText: "Search/Create Party",
          ),
          buildPartyNameList(),
          buildPartyNameList(isText: true),
          buildTextIconButton(
              title: "Mobile Number",
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const AddPartySheet(),
                );
              }),
        ],
      ),
    );
  }

  Widget buildPartyNameList({bool isText = false}) {
    return Card(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: ColorCode.colorOrange,
                child: Icon(
                  Icons.local_fire_department,
                  color: ColorCode.colorWhite,
                ),
              ),
              trailing: isText
                  ? Text(
                      "Phone Book",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorCode.colorGrey,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          size: 18,
                          color: ColorCode.colorGrey,
                        ),
                        Text(
                          "100.0",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorCode.colorGrey,
                          ),
                        ),
                        Icon(
                          Icons.arrow_upward,
                          size: 18,
                          color: ColorCode.colorRed,
                        ),
                      ],
                    ),
              title: const Text("Party Name"),
              subtitle: const Text("9685741023"),
            );
          },
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
