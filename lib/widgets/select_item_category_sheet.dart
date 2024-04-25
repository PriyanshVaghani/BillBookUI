import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/bottom_sheet_title_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class SelectItemCategorySheet extends StatefulWidget {
  const SelectItemCategorySheet({super.key, required this.passContext});
  final BuildContext passContext;
  @override
  State<SelectItemCategorySheet> createState() =>
      _SelectItemCategorySheetState();
}

class _SelectItemCategorySheetState extends State<SelectItemCategorySheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.maxFinite,
      height: MediaQuery.of(widget.passContext).size.height - 48,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BuildBottomSheetTitleWidget(title: "Select Item Category"),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pop(widget.passContext);
              showModalBottomSheet(
                context: widget.passContext,
                builder: (BuildContext context) {
                  return buildAddCategorySheet(context);
                },
              );
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            icon: Icon(
              Icons.add,
              size: 30,
              color: ColorCode.colorPrimaryColor,
            ),
            label: Text(
              "Add Category",
              style: TextStyle(
                fontSize: 22,
                color: ColorCode.colorPrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RadioListTile(
                  value: index,
                  groupValue: 0,
                  onChanged: (value) {},
                  title: Text("Item $index"),
                  controlAffinity: ListTileControlAffinity.trailing,
                  dense: true,
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  buildAddCategorySheet(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BuildBottomSheetTitleWidget(title: "Create Category"),
            buildTextFormFieldTitle("Category Name"),
            buildTextFormField(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(color: ColorCode.colorWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
