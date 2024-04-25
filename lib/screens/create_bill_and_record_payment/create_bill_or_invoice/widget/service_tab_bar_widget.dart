import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/widget/option_other_widget.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/widget/option_pricing_widget.dart';
import 'package:flutter/material.dart';

class ServiceTabBarWidget extends StatefulWidget {
  const ServiceTabBarWidget({super.key});

  @override
  State<ServiceTabBarWidget> createState() => _ServiceTabBarWidgetState();
}

class _ServiceTabBarWidgetState extends State<ServiceTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: "Pricing",
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
                OptionOtherWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
