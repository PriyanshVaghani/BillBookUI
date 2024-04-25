import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/widget/option_other_widget.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/widget/option_pricing_widget.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/widget/option_stock_widget.dart';
import 'package:flutter/material.dart';

class ProductTabBarWidget extends StatefulWidget {
  const ProductTabBarWidget({super.key});

  @override
  State<ProductTabBarWidget> createState() => _ProductTabBarWidgetState();
}

class _ProductTabBarWidgetState extends State<ProductTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: "Pricing",
              ),
              Tab(
                text: "Stock",
              ),
              Tab(
                text: "Other",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                OptionPricingWidget(),
                OptionStockWidget(),
                OptionOtherWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
