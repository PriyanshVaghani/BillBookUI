import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/create_new_item_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/selecte_category_button_widget.dart';
import 'package:flutter/material.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  bool isPriceDisplay = false; // it is for added item list is scrolled or not
  bool isEdit = false; // it for user add  or edit the item quantity
  bool isExpand = false; // it is for expand and display MRP or not
  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  void bottomSheetExpand() {
    draggableScrollableController.jumpTo(isExpand ? 0.24 : 1);
    setState(() {
      isExpand = !isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: !isExpand
            ? AppBar(
                title: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          Icon(
                            Icons.mic_none,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ],
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: ColorCode.colorGrey.withOpacity(0.2),
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                  ),
                ),
              )
            : null,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SelectCategoryButtonWidget(),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateNewItemScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: ColorCode.colorGrey.withOpacity(0.3),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: ColorCode.colorBlack,
                  ),
                  label: Text(
                    "Create New Item",
                    style: TextStyle(
                      color: ColorCode.colorBlack,
                    ),
                  ),
                ),
              ],
            ),
            buildList(),
          ],
        ),
        bottomSheet: isEdit
            ? DraggableScrollableSheet(
                initialChildSize: 0.235,
                minChildSize: 0.235,
                maxChildSize: 1,
                controller: draggableScrollableController,
                shouldCloseOnMinExtent: false,
                expand: false,
                builder: (
                  BuildContext context,
                  ScrollController scrollController,
                ) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        color: ColorCode.colorGrey.withOpacity(0.2),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: bottomSheetExpand,
                              icon: isExpand
                                  ? const Icon(Icons.arrow_circle_down)
                                  : const Icon(Icons.arrow_circle_up),
                            ),
                            const SizedBox(width: 5),
                            const Text("1.0 ITEMS"),
                            const Spacer(),
                            const Text(
                              "₹ 136.50",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.only(top: 8),
                                controller: scrollController,
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: ColorCode.colorPrimaryColor
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Center(
                                          child: Text("S"),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Sample Item",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const Text(
                                            "Amul Butter 500gm",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(
                                                width: 100,
                                                child: Text(
                                                  "\$ 220/BOX",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isPriceDisplay =
                                                        !isPriceDisplay;
                                                  });
                                                },
                                                child: Icon(
                                                  isPriceDisplay
                                                      ? Icons.keyboard_arrow_up
                                                      : Icons
                                                          .keyboard_arrow_down,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Text("STOCK: 124BOX"),
                                          const SizedBox(height: 8),
                                          isPriceDisplay
                                              ? SizedBox(
                                                  width: 120,
                                                  child: Row(
                                                    children: [
                                                      buildPriceTag(
                                                          priceTag: 'PP',
                                                          price: 190),
                                                      buildPriceTag(
                                                          priceTag: "MRP",
                                                          price: 235),
                                                    ],
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                      const Spacer(),
                                      isEdit
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: ColorCode
                                                        .colorWhite
                                                        .withOpacity(0.5),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isEdit = false;
                                                    });
                                                  },
                                                  child: const Text("EDIT"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color:
                                                          ColorCode.colorGrey,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: const Row(
                                                    children: [
                                                      Icon(Icons.remove),
                                                      VerticalDivider(),
                                                      Text("1.0"),
                                                      VerticalDivider(),
                                                      Icon(Icons.add),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                const SizedBox(height: 40),
                                                OutlinedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: ColorCode
                                                        .colorWhite
                                                        .withOpacity(0.5),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isEdit = true;
                                                    });
                                                  },
                                                  child: const Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text("Add"),
                                                      Icon(Icons.add)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16.0),
                              color: ColorCode.colorWhite,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Add more details",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: ColorCode.colorPrimaryColor,
                                          ),
                                        ),
                                        Text(
                                          "Additional charges, Round off...",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: ColorCode.colorGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: Theme.of(context)
                                        .elevatedButtonTheme
                                        .style,
                                    child: Text(
                                      "Generate Bill",
                                      style: TextStyle(
                                          color: ColorCode.colorWhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )
            : null,
      ),
    );
  }

  Widget buildPriceTag({required String priceTag, required double price}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            priceTag,
            style: TextStyle(color: ColorCode.colorGrey),
          ),
          Text(
            "₹ $price",
          ),
        ],
      ),
    );
  }

  Widget buildList() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorCode.colorPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text("S"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sample Item",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Amul Butter 500gm",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text(
                          "\$ 220/BOX",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isPriceDisplay = !isPriceDisplay;
                          });
                        },
                        child: Icon(
                          isPriceDisplay
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text("STOCK: 124BOX"),
                  const SizedBox(height: 8),
                  isPriceDisplay
                      ? SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              buildPriceTag(priceTag: 'PP', price: 190),
                              buildPriceTag(priceTag: "MRP", price: 235),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const Spacer(),
              isEdit
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                ColorCode.colorWhite.withOpacity(0.5),
                          ),
                          onPressed: () {
                            setState(() {
                              isEdit = false;
                            });
                          },
                          child: const Text("EDIT"),
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: ColorCode.colorGrey,
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.remove),
                              VerticalDivider(),
                              Text("1.0"),
                              VerticalDivider(),
                              Icon(Icons.add),
                            ],
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 40),
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                ColorCode.colorWhite.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isEdit = true;
                            });
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [Text("Add"), Icon(Icons.add)],
                          ),
                        ),
                      ],
                    ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 3,
      ),
    );
  }
}
