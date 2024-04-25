import 'package:bill_book_ui/widgets/select_item_category_sheet.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class OptionOtherWidget extends StatefulWidget {
  const OptionOtherWidget({super.key});

  @override
  State<OptionOtherWidget> createState() => _OptionOtherWidgetState();
}

class _OptionOtherWidgetState extends State<OptionOtherWidget> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorCode.colorPrimaryColor.withOpacity(0.1),
      child: Column(
        children: [
          Container(
            color: ColorCode.colorWhite,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorCode.colorGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: ColorCode.colorBlack.withOpacity(0.5),
                      ),
                      Text(
                        "Add Image",
                        style: TextStyle(
                          color: ColorCode.colorBlack.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                buildTextFormFieldTitle("Item Category"),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SelectItemCategorySheet(
                            passContext: context,
                          );
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: ColorCode.colorGrey.withOpacity(0.3),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorCode.colorBlack,
                    ),
                    label: Text(
                      "Select Category",
                      style: TextStyle(
                        color: ColorCode.colorBlack,
                      ),
                    ),
                  ),
                ),
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
                const SizedBox(height: 8),
                buildTextFormFieldTitle("Item Description"),
                buildTextFormField(
                    hintText: "Ex: 100% Real Mixed Fruit Jam", maxLines: 2),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  title: const Text("Show in Online Store"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
