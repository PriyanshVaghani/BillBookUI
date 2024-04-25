import 'package:bill_book_ui/screens/create_bill_and_record_payment/create_bill_or_invoice/create_bill_or_invoice_screen.dart';
import 'package:bill_book_ui/screens/create_bill_and_record_payment/record_payment/record_payment_in_screen.dart';
import 'package:bill_book_ui/screens/dashboard/widget/search_and_filter_widget.dart';
import 'package:bill_book_ui/screens/dashboard/widget/transaction_list_widget.dart';
import 'package:bill_book_ui/screens/dashboard/widget/transaction_type_sheet.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/change_business_bottom_sheet.dart';
import 'package:bill_book_ui/screens/dashboard/widget/dashboard_card_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  bool isScroll = false;
  bool isSheetOpen = false;
  // late Animation animation;
  // late AnimationController animationController;
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        setState(() {
          isScroll = true;
        });
      } else if (isScroll) {
        setState(() {
          isScroll = false;
        });
      }

      // double scrollOffset = scrollController.offset;
      // double maxScrollExtent = scrollController.position.maxScrollExtent;
      // double percentScrolled = scrollOffset / maxScrollExtent;
      // double targetWidth = 50.0 * percentScrolled;
      // animationController.value = targetWidth;
    });

    // animationController = AnimationController(vsync: this);
    // animation = Tween(begin: 0.0, end: 0.0).animate(animationController);

    // animationController.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCode.colorPrimaryColor.withOpacity(0.1),
        body: CustomScrollView(
          controller: scrollController,
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const ChangeBusinessBottomSheet();
                      },
                    );
                  },
                  icon: Icon(Icons.keyboard_arrow_down,
                      color: ColorCode.colorBlack),
                  label: Text(
                    "Business Name ",
                    style: TextStyle(color: ColorCode.colorBlack),
                  ),
                ),
              ),
              flexibleSpace: Container(
                margin: const EdgeInsets.only(
                    top: kToolbarHeight, left: 24, right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: ColorCode.colorGreen,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Get 0zero collateral loans up to \n\$50 Lakh with myBillBool.",
                              style: TextStyle(
                                color: ColorCode.colorWhite,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: ColorCode.colorWhite,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Apply Now",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: ColorCode.colorGreen,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 15,
                                    color: ColorCode.colorGreen,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 80,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        children: [
                          DashBoardCardWidget(
                            title: "\$ 0",
                            subtitle: "To Collect",
                            textColor: ColorCode.colorGreen,
                            borderColor: ColorCode.colorGreen,
                          ),
                          DashBoardCardWidget(
                            title: "\$ 100",
                            subtitle: "To Pay",
                            textColor: ColorCode.colorRed,
                            borderColor: ColorCode.colorRed,
                          ),
                          DashBoardCardWidget(
                            title: "Stock Value",
                            subtitle: "Value of Item",
                            borderColor: ColorCode.colorPrimaryColor,
                          ),
                          DashBoardCardWidget(
                            title: "\$ 0",
                            subtitle: "To Collect",
                            borderColor: ColorCode.colorPrimaryColor,
                          ),
                          DashBoardCardWidget(
                            title: "Total Balance",
                            subtitle: "Cash + Bank Balance",
                            borderColor: ColorCode.colorPrimaryColor,
                          ),
                          DashBoardCardWidget(
                            title: "Reports",
                            subtitle: "Sales, Party",
                            borderColor: ColorCode.colorPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.subscriptions),
                        const SizedBox(width: 8),
                        const Text("Login to multiple devices"),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.calculate)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.local_offer)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.computer)),
              ],
              primary: true,
              centerTitle: false,
              expandedHeight: 480,
              collapsedHeight: 220,
              floating: false,
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isScroll
                      ? const SearchAnfFilterWidget() // When user scroll up then it display search and filter filed
                      : const TransactionListWidget(), // else by default it display only list of translation
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 45,
              child: FloatingActionButton.extended(
                backgroundColor: ColorCode.colorBlack,
                heroTag: "fab1",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecordPaymentInScreen(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                label: Text(
                  "Received Payment",
                  style: TextStyle(
                    color: ColorCode.colorWhite,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: ColorCode.colorGreen,
              shape: const CircleBorder(),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const TransactionTypeSheet();
                  },
                );
              },
              child: Icon(
                Icons.add,
                color: ColorCode.colorWhite,
              ),
            ),
            SizedBox(
              height: 45,
              child: FloatingActionButton.extended(
                backgroundColor: ColorCode.colorPrimaryColor,
                heroTag: "fab2",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateBillOrInvoiceScreen(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                icon: Icon(
                  Icons.add,
                  color: ColorCode.colorWhite,
                ),
                label: Text(
                  "Bill / Invoice",
                  style: TextStyle(
                    color: ColorCode.colorWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
