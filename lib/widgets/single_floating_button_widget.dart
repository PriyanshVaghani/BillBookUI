import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class SingleFloatingButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonTitle;

  const SingleFloatingButtonWidget(
      {super.key, this.onPressed, this.buttonTitle = "Continues"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 24,
      child: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: onPressed == null
            ? ColorCode.colorPrimaryColor.withOpacity(0.5)
            : ColorCode.colorPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: onPressed,
        label: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 22,
            color: ColorCode.colorWhite,
          ),
        ),
      ),
    );
  }
}
