import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class OptionStockWidget extends StatefulWidget {
  const OptionStockWidget({super.key});

  @override
  State<OptionStockWidget> createState() => _OptionStockWidgetState();
}

class _OptionStockWidgetState extends State<OptionStockWidget> {
  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextFormFieldTitle("Opening Stock"),
                        const SizedBox(height: 8),
                        buildTextFormField(
                          hintText: "Ex: 35",
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "/PCS",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextFormFieldTitle("As of Date"),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {},
                          child: buildTextFormField(
                            textEditingController:
                                TextEditingController(text: "10 Apr 2024"),
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: ColorCode.colorBlack,
                            ),
                            isEnabled: false,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 30,
                    ),
                    const Text(
                      "Low stock alert",
                      style: TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    Switch(
                      value: isSwitchOn,
                      onChanged: (value) {
                        setState(() {
                          isSwitchOn = value;
                        });
                      },
                      inactiveThumbColor: ColorCode.colorWhite,
                      activeColor: ColorCode.colorPrimaryColor,
                      inactiveTrackColor: ColorCode.colorGrey,
                      activeTrackColor:
                          ColorCode.colorPrimaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              isSwitchOn
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextFormFieldTitle("Low Stock Quantity"),
                        buildTextFormField(
                          hintText: "Ex: 35",
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "/PCS",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: ColorCode.colorPrimaryColor.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
