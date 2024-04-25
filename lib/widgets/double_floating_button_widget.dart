import 'package:bill_book_ui/screens/parties/create_new_party_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class DoubleFloatingButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed2;
  final String buttonTitle1;

  const DoubleFloatingButtonWidget(
      {super.key, this.onPressed2, this.buttonTitle1 = "Create New Item"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton.extended(
          heroTag: "fab1",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateNewPartyScreen()));
          },
          label: Text(
            "Create Party",
            style: TextStyle(color: ColorCode.colorWhite),
          ),
          icon: Icon(Icons.add, color: ColorCode.colorWhite),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          backgroundColor: ColorCode.colorBlack,
          onPressed: onPressed2,
          child: Icon(Icons.file_open_sharp, color: ColorCode.colorWhite),
        ),
      ],
    );
  }
}
