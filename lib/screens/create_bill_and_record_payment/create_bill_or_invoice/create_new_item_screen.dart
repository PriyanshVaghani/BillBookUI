import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/widget/product_tab_bar_widget.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/widget/service_tab_bar_widget.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/choice_chip_widget.dart';
import 'package:bill_book_ui/widgets/text_form_field_and_title_widget.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:flutter/material.dart';

class CreateNewItemScreen extends StatefulWidget {
  const CreateNewItemScreen({super.key});

  @override
  State<CreateNewItemScreen> createState() => _CreateNewItemScreenState();
}

class _CreateNewItemScreenState extends State<CreateNewItemScreen> {
  List<String> itemTypes = ["Product", "Service"];
  int selectedItemIndex =
      0; // it for select item type 0 for product and 1 for service

  void _onSelectedItemIndex(int index) {
    setState(() {
      selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Create New Item"),
          iconTheme: IconThemeData(color: ColorCode.colorPrimaryColor),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextFormFieldTitle("Item Name"),
                  buildTextFormField(hintText: "Ex: Kissan Fruit Jam 500 gm"),
                  const SizedBox(height: 8),
                  buildTextFormFieldTitle("Item Type"),
                  itemTypeChip(),
                ],
              ),
            ),
            Expanded(
              child: selectedItemIndex == 0
                  ? const ProductTabBarWidget()
                  : const ServiceTabBarWidget(),
            ),
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

  Widget itemTypeChip() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // bool isSelected = selectedItemIndex == index;
          return buildChoiceChip(
            title: itemTypes[index],
            index: index,
            selectedIndex: selectedItemIndex,
            onTap: _onSelectedItemIndex,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: itemTypes.length,
      ),
    );
  }
}
