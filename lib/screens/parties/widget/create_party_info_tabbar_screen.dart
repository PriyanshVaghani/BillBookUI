import 'package:bill_book_ui/screens/parties/widget/option_business_info_widget.dart';
import 'package:bill_book_ui/screens/parties/widget/option_credit_info_widget.dart';
import 'package:bill_book_ui/screens/parties/widget/option_other_details_widget.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class CreatePartyInfoTabBarScreen extends StatefulWidget {
  const CreatePartyInfoTabBarScreen({super.key});

  @override
  State<CreatePartyInfoTabBarScreen> createState() =>
      _CreatePartyInfoTabBarScreenState();
}

class _CreatePartyInfoTabBarScreenState
    extends State<CreatePartyInfoTabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  child: Text("Business Info"),
                ),
                Tab(
                  child: Text("Credit Info"),
                ),
                Tab(
                  child: Text("Other Details"),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: ColorCode.colorPrimaryColor.withOpacity(0.2),
                child: const TabBarView(
                  children: [
                    // Business Info
                    OptionBusinessInfoWidget(),
                    // Credit Info
                    OptionCreditInfoWidget(),
                    // other details
                    OptionOtherDetailsWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
