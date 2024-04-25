import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class ChangeBusinessBottomSheet extends StatefulWidget {
  const ChangeBusinessBottomSheet({super.key});

  @override
  State<ChangeBusinessBottomSheet> createState() =>
      _ChangeBusinessBottomSheetState();
}

class _ChangeBusinessBottomSheetState extends State<ChangeBusinessBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Change Business",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.cancel))
            ],
          ),
          const Text("Choose the business you want to see the data"),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorCode.colorPrimaryColor.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide.none,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorCode.colorGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "B",
                      style:
                          TextStyle(color: ColorCode.colorWhite, fontSize: 22),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "Business Name",
                  style: TextStyle(color: ColorCode.colorBlack, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  "Edit",
                  style: TextStyle(
                    color: ColorCode.colorPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: ColorCode.colorPrimaryColor,
                ),
              ),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: ColorCode.colorPrimaryColor,
            ),
            label: Text(
              "Add New Business",
              style: TextStyle(
                color: ColorCode.colorPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
