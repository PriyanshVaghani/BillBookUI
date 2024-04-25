import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/utility/const_list.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class OptionPricingWidget extends StatefulWidget {
  const OptionPricingWidget({super.key});

  @override
  State<OptionPricingWidget> createState() => _OptionPricingWidgetState();
}

class _OptionPricingWidgetState extends State<OptionPricingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorCode.colorPrimaryColor.withOpacity(0.1),
      child: Column(
        children: [
          Container(
            color: ColorCode.colorWhite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextFormFieldTitle("Unit"),
                const SizedBox(height: 4),
                buildTextFormField(
                    textEditingController: TextEditingController(text: "PCS")),
                const SizedBox(height: 16),
                buildTextFormFieldTitle("Sales Price"),
                const SizedBox(height: 4),
                buildTextFormField(
                  hintText: "130",
                  prefixIcon: const Icon(Icons.currency_rupee),
                  suffixIcon: buildDropdownButton(),
                ),
                const SizedBox(height: 16),
                buildTextFormFieldTitle("Purchase Price"),
                const SizedBox(height: 4),
                buildTextFormField(
                  hintText: "115",
                  prefixIcon: const Icon(Icons.currency_rupee),
                  suffixIcon: buildDropdownButton(),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextFormFieldTitle("Opening Stock"),
                          const SizedBox(height: 4),
                          buildTextFormField(
                            hintText: "Ex: 6704",
                            suffixIcon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextFormFieldTitle("GST"),
                          const SizedBox(height: 4),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ColorCode.colorGrey,
                              ),
                            ),
                            child: DropdownButton(
                              value: 0,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              padding: const EdgeInsets.only(left: 8),
                              items: listOfGST
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: listOfGST.indexOf(e),
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownButton() {
    return DropdownButton(
      value: 0,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text("With Text"),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text("Without Text"),
        ),
      ],
      onChanged: (value) {},
    );
  }
}
