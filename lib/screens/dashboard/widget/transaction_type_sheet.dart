import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class TransactionTypeSheet extends StatefulWidget {
  const TransactionTypeSheet({super.key});

  @override
  State<TransactionTypeSheet> createState() => _TransactionTypeSheetState();
}

class _TransactionTypeSheetState extends State<TransactionTypeSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: ColorCode.colorWhite,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          title("Sales Transaction"),
          listOfTransaction(length: 9),
          title("Purchase Transaction"),
          listOfTransaction(length: 6),
          title("Other Transaction"),
          listOfTransaction(length: 1),
          Align(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel),
            ),
          ),
        ],
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget listOfTransaction({required int length}) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: length,
      itemBuilder: (context, index) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorCode.colorGreen.withOpacity(0.2),
                    child: Icon(
                      Icons.account_balance,
                      color: ColorCode.colorGreen,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: ColorCode.colorWhite,
                      child: Icon(
                        Icons.workspace_premium,
                        color: ColorCode.colorGreen,
                        size: 10,
                      ),
                    ),
                  )
                ],
              ),
              const Text(
                "Bill / Invoice",
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      },
    );
  }
}
