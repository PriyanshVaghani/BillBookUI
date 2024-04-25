import 'package:bill_book_ui/model/items_details_model.dart';
import 'package:bill_book_ui/screens/items/adjust_stock_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/utility/date_format.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.itemDetails});
  final ItemsDetailsModel itemDetails;
  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_forever_outlined,
                color: ColorCode.colorRed,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.itemDetails.itemName),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextButton.icon(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          label: const Text("View Item Report"),
                          icon: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: ColorCode.colorGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        widget.itemDetails.itemName[0].toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          color: ColorCode.colorWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  buildDetails(
                      "Sales Price", "₹ ${widget.itemDetails.salesPrice}"),
                  buildDetails("Purchase Price",
                      "₹ ${widget.itemDetails.purchasePrice}"),
                  buildDetails("Stock Quantity",
                      "${widget.itemDetails.stockQuantity} ${widget.itemDetails.measuringUnit}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  buildDetails(
                      "Stock Value", "₹ ${widget.itemDetails.stockValue}"),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      isScrollable: true,
                      padding: EdgeInsets.zero,
                      tabs: [
                        Tab(
                          child: Text("Item Timeline"),
                        ),
                        Tab(
                          child: Text("Details"),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // items Timeline
                          Container(
                            color: ColorCode.colorPrimaryColor.withOpacity(0.1),
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                getDateFormat(widget
                                                    .itemDetails.stockDate),
                                              ),
                                              Text(
                                                "${widget.itemDetails.stockQuantity} ${widget.itemDetails.measuringUnit}",
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Opening Stock",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${widget.itemDetails.stockQuantity} ${widget.itemDetails.measuringUnit}",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          // details
                          Container(
                            color: ColorCode.colorPrimaryColor.withOpacity(0.1),
                            child: Column(
                              children: [
                                Container(
                                  color: ColorCode.colorWhite,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 14),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          buildDetails("Item Code",
                                              widget.itemDetails.itemCode),
                                          buildDetails("Measuring Unit",
                                              widget.itemDetails.measuringUnit),
                                          buildDetails("Low Stock At",
                                              "${widget.itemDetails.lowStock} ${widget.itemDetails.measuringUnit}"),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          buildDetails("Tax Rate",
                                              "${widget.itemDetails.taxRate}%"),
                                          buildDetails("HSN Code",
                                              widget.itemDetails.hsnCode),
                                          buildDetails("Item Type",
                                              widget.itemDetails.itemType),
                                        ],
                                      ),
                                      widget.itemDetails.desc.isEmpty
                                          ? const SizedBox()
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Divider(),
                                                Row(
                                                  children: [
                                                    buildDetails(
                                                        "Item Description",
                                                        widget
                                                            .itemDetails.desc),
                                                  ],
                                                ),
                                              ],
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdjustStockScreen(
                  stockQuantity: widget.itemDetails.stockQuantity,
                  measuringUnit: widget.itemDetails.measuringUnit,
                ),
              ),
            );
          },
          label: Text(
            "Adjust Stock",
            style: TextStyle(color: ColorCode.colorWhite),
          ),
        ),
      ),
    );
  }

  Widget buildDetails(String title, String details) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 4),
          Text(
            details,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
