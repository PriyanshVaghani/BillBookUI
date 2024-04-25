import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class AddPartySheet extends StatefulWidget {
  const AddPartySheet({super.key});

  @override
  State<AddPartySheet> createState() => _AddPartySheetState();
}

class _AddPartySheetState extends State<AddPartySheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          top: 10,
          left: 14,
          right: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel),
            ),
          ),
          TextFormField(
            autofocus: true,
            cursorColor: ColorCode.colorPrimaryColor,
            decoration: InputDecoration(
              labelText: "Party Name",
              labelStyle: TextStyle(color: ColorCode.colorPrimaryColor),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorCode.colorPrimaryColor,
                ),
              ),
            ),
          ),
          TextFormField(
            autofocus: true,
            cursorColor: ColorCode.colorPrimaryColor,
            decoration: InputDecoration(
              labelText: "Phone Number (Optional)",
              labelStyle: TextStyle(color: ColorCode.colorPrimaryColor),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorCode.colorPrimaryColor,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Add more details",
                          style: TextStyle(
                              color: ColorCode.colorPrimaryColor, fontSize: 18),
                        ),
                        Text(
                          "Balance, Credit...",
                          style: TextStyle(
                              color: ColorCode.colorGrey, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {},
                    child: Text(
                      "Save Party",
                      style: TextStyle(
                        color: ColorCode.colorWhite,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
