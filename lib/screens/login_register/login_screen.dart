import 'package:bill_book_ui/screens/login_register/otp_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Mobile Number",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "We'll send a code to your phone number to verify it."
                " Keep this number same as your whatsapp number",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: textEditingController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 18, color: ColorCode.colorBlack),
                onChanged: (value) {
                  if (value.length == 10) setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 16),
                    child: Text(
                      "+91 ",
                      style:
                          TextStyle(fontSize: 20, color: ColorCode.colorBlack),
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorCode.colorPrimaryColor,
                      width: 2,
                    ),
                  ),
                ),
                maxLength: 10,
                inputFormatters: [
                  // FilteringTextInputFormatter.allow(
                  //   RegExp(r'[0-9]'),
                  // ),
                  FilteringTextInputFormatter.digitsOnly
                ],
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SingleFloatingButtonWidget(
          onPressed: textEditingController.text.length != 10
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPScreen(
                        mobileNumber: textEditingController.text,
                      ),
                    ),
                  );
                },
        ),
      ),
    );
  }
}
