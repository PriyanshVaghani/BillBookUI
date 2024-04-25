import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/utility/date_format.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:flutter/material.dart';

class AdjustStockScreen extends StatefulWidget {
  const AdjustStockScreen(
      {super.key,
      required this.stockQuantity,
      required this.measuringUnit,
      this.adjustType = 0});
  final double stockQuantity;
  final String measuringUnit;
  final int adjustType;
  @override
  State<AdjustStockScreen> createState() => _AdjustStockScreenState();
}

class _AdjustStockScreenState extends State<AdjustStockScreen> {
  int selectedAdjustType = 0;
  DateTime dateTime = DateTime.now();
  bool isAddNote = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedAdjustType = widget.adjustType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adjust Stock"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  buildRadioButton("Add Stock", 0),
                  const SizedBox(width: 16),
                  buildRadioButton("Reduce Stock", 1),
                ],
              ),
              const SizedBox(height: 32),
              buildTextFormFieldTitle("Date"),
              InkWell(
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2050),
                    initialDate: DateTime.now(),
                  );
                  if (date != null && date != dateTime) {
                    setState(() {
                      dateTime = date;
                    });
                  }
                },
                child: buildTextFormField(
                  isEnabled: false,
                  textEditingController: TextEditingController(
                    text: getDateFormat(dateTime),
                  ),
                  suffixIcon: const Icon(Icons.calendar_month),
                ),
              ),
              const SizedBox(height: 24),
              buildTextFormFieldTitle("Please add quantity"),
              buildTextFormField(
                hintText: "Ex: 35",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.measuringUnit,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              isAddNote
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        buildTextFormFieldTitle("Add Note / Description"),
                        buildTextFormField(
                          hintText: "Ex: Good expired",
                        ),
                        const SizedBox(height: 24),
                      ],
                    )
                  : TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isAddNote = true;
                        });
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      icon: const Icon(Icons.add),
                      label: const Text("Add Note / Description"),
                    ),

              // current stock
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorCode.colorGrey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Current Stock"),
                    Text(
                      "${widget.stockQuantity} ${widget.measuringUnit}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: SingleFloatingButtonWidget(
          buttonTitle: "Save",
          onPressed: () {},
        ),
      ),
    );
  }

  Widget buildRadioButton(String title, int value) {
    bool isSelected = selectedAdjustType == value;
    return Expanded(
      child: RadioListTile(
        value: value,
        groupValue: selectedAdjustType,
        onChanged: (value) {
          setState(() {
            selectedAdjustType = value!;
          });
        },
        selected: isSelected,
        title: Text(title),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
              width: 1.5,
              color: isSelected
                  ? ColorCode.colorPrimaryColor
                  : ColorCode.colorGrey),
        ),
        selectedTileColor: ColorCode.colorPrimaryColor.withOpacity(0.2),
      ),
    );
  }
}
