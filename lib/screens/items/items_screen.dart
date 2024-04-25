import 'package:bill_book_ui/model/items_details_model.dart';
import 'package:bill_book_ui/screens/items/adjust_stock_screen.dart';
import 'package:bill_book_ui/screens/items/item_detail_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/category_chip_widget.dart';
import 'package:bill_book_ui/widgets/double_floating_button_widget.dart';
import 'package:bill_book_ui/widgets/filter_chip_widget.dart';
import 'package:bill_book_ui/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  bool isSearch = false;
  bool isLowStock = false;

  setIsSearch() {
    setState(() {
      isSearch = !isSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCode.colorPrimaryColor.withOpacity(0.1),
        appBar: AppBar(
          title: isSearch
              ? buildIsSearchTrue(setIsSearch)
              : buildIsSearchFalse(setIsSearch),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: ColorCode.colorPrimaryColor,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(
                    showCheckmark: false,
                    label: isLowStock
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Low Stock",
                                style: TextStyle(
                                    color: ColorCode.colorPrimaryColor),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.cancel),
                            ],
                          )
                        : const Text("Low Stock"),
                    selected: isLowStock,
                    onSelected: (bool value) {
                      setState(() {
                        isLowStock = value;
                      });
                    },
                    backgroundColor: ColorCode.colorWhite,
                    selectedColor: ColorCode.colorPrimaryColor.withOpacity(0.2),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: ColorCode.colorPrimaryColor,
                        width: isLowStock ? 1.5 : 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const CategoryChipWidget(),
                  const SizedBox(width: 12),
                  const FilterChipWidget(),
                ],
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              ItemsDetailsModel itemDetails = items[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ItemDetailScreen(itemDetails: itemDetails)));
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          itemDetails.itemName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(itemDetails.desc),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: ColorCode.colorGrey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              itemDetails.itemName[0].toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20, color: ColorCode.colorWhite),
                            ),
                          ),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${itemDetails.stockQuantity}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(itemDetails.itemType),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 84),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Sales Price"),
                                Text("${itemDetails.salesPrice}"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Purchase Price"),
                                Text("${itemDetails.purchasePrice}"),
                              ],
                            ),
                          ),
                          PopupMenuButton(
                            icon: const Icon(Icons.line_weight),
                            initialValue: -1,
                            itemBuilder: (context) {
                              return {0: "Add Stock", 1: "Reduce Stock"}
                                  .entries
                                  .map(
                                    (e) => PopupMenuItem(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdjustStockScreen(
                                              stockQuantity:
                                                  itemDetails.stockQuantity,
                                              measuringUnit:
                                                  itemDetails.measuringUnit,
                                              adjustType: e.key,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        e.value,
                                        style: TextStyle(
                                          color: e.key == 1
                                              ? ColorCode.colorRed
                                              : ColorCode.colorBlack,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
        floatingActionButton: DoubleFloatingButtonWidget(
          onPressed2: () {},
        ),
      ),
    );
  }
}
