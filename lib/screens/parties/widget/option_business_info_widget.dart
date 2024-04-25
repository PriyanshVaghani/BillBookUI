import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class OptionBusinessInfoWidget extends StatefulWidget {
  const OptionBusinessInfoWidget({super.key});

  @override
  State<OptionBusinessInfoWidget> createState() =>
      _OptionBusinessInfoWidgetState();
}

class _OptionBusinessInfoWidgetState extends State<OptionBusinessInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: ColorCode.colorWhite,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextFormFieldTitle("GST Number"),
              buildTextFormField(hintText: "Ex: 24AAACC1206D1ZM"),
              const SizedBox(height: 16),
              buildTextFormFieldTitle("PAN Number"),
              buildTextFormField(hintText: "Ex: AAACC1206D"),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const BuildBottomSheetTitleWidget(
                            title: "Add Billing Address"),
                        const SizedBox(height: 16),
                        buildTextFormFieldTitle("Street Address"),
                        buildTextFormField(hintText: "Ex: 15 Hill View Apt."),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildTextFormFieldTitle("State"),
                                  PopupMenuButton(
                                    child: Container(
                                      width: double.maxFinite,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: ColorCode.colorGrey,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Ex: Maharastra",
                                            style: TextStyle(
                                              color: ColorCode.colorGrey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Icon(Icons.keyboard_arrow_down)
                                        ],
                                      ),
                                    ),
                                    itemBuilder: (context) {
                                      return ["Surat", "Maharashtra"]
                                          .map((e) =>
                                              PopupMenuItem(child: Text(e)))
                                          .toList();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildTextFormFieldTitle("Pincode"),
                                  buildTextFormField(hintText: "Ex: Bengaluru"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        buildTextFormFieldTitle("City"),
                        buildTextFormField(hintText: "Ex: Bengaluru"),
                        const SizedBox(height: 16),
                        SingleFloatingButtonWidget(
                          onPressed: () {},
                          buttonTitle: "Save",
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            color: ColorCode.colorWhite,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 12),
            child: const Row(
              children: [
                Icon(Icons.location_city),
                SizedBox(width: 16),
                Text("Billing Address"),
                Spacer(),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
        )
      ],
    );
  }
}
