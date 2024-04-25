import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/selecte_category_button_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class OptionOtherDetailsWidget extends StatefulWidget {
  const OptionOtherDetailsWidget({super.key});

  @override
  State<OptionOtherDetailsWidget> createState() =>
      _OptionOtherDetailsWidgetState();
}

class _OptionOtherDetailsWidgetState extends State<OptionOtherDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: ColorCode.colorWhite,
          width: double.maxFinite,
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              buildTextFormFieldTitle("Party Category"),
              const SelectCategoryButtonWidget(),
              const SizedBox(height: 8),
              buildTextFormFieldTitle("Custom Fields"),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Add Fields to Item'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
