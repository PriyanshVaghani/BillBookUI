import 'package:bill_book_ui/screens/dashboard/widget/select_date_sheet_widget.dart';
import 'package:bill_book_ui/screens/dashboard/widget/sort_option_sheet_widget.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class SearchAnfFilterWidget extends StatefulWidget {
  const SearchAnfFilterWidget({super.key});

  @override
  State<SearchAnfFilterWidget> createState() => _SearchAnfFilterWidgetState();
}

class _SearchAnfFilterWidgetState extends State<SearchAnfFilterWidget>
    with SingleTickerProviderStateMixin {
  List<String> tabOptions = [
    "All",
    "Sales",
    "Received Payment",
    "Sales Return",
    "Credit Note",
    "Quotation"
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabOptions.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Card(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: ColorCode.colorGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const SortOptionSheetWidget();
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: ColorCode.colorBlack,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.sort,
                                color: ColorCode.colorWhite,
                                size: 30,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "SORT",
                                style: TextStyle(
                                    color: ColorCode.colorWhite, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                      hintText: "Search",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: ColorCode.colorPrimaryColor.withOpacity(0.1),
                        border: Border.all(
                          color: ColorCode.colorPrimaryColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: tabOptions
                          .map(
                            (e) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorCode.colorBlack,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return const SelectDateSheetWidget();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(width: 8),
                        const Text(
                          "Last Week",
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "25 Mar 2024 - 31 Mar 2024",
                          style: TextStyle(color: ColorCode.colorGrey),
                        ),
                        const Spacer(),
                        Text(
                          "CHANGE",
                          style: TextStyle(color: ColorCode.colorPrimaryColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabOptions
                  .map(
                    (e) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 50,
                          ),
                          Text("No $e Found"),
                          const Text("To view previous financial year data"),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Change Date"),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
