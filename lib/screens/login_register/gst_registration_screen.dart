import 'package:bill_book_ui/screens/navigation_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GSTRegistration extends StatefulWidget {
  const GSTRegistration({super.key});

  @override
  State<GSTRegistration> createState() => _GSTRegistrationState();
}

class _GSTRegistrationState extends State<GSTRegistration> {
  TextEditingController textEditingController = TextEditingController();
  int isGSTRegistered = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Is Your Business GST Registered ?",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Automatically fill business details by adding gst number",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      buildRadioButton(0, "Yes"),
                      const SizedBox(width: 10),
                      buildRadioButton(1, "No"),
                    ],
                  ),
                  if (isGSTRegistered == 0) buildGSTNumberField(),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Add Referral Code"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      icon: Icon(
                        Icons.lock_outline,
                        color: ColorCode.colorGreen,
                        size: 20,
                      ),
                      label: Text(
                        "Your data is safe.",
                        style: TextStyle(color: ColorCode.colorGreen),
                      ),
                    ),
                    const Text(" We do not share your data"),
                  ],
                ),
              ),
              // const SizedBox(height: 20)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SingleFloatingButtonWidget(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationScreen(),
              ),
            );
          },
          buttonTitle: "Create First Invoice",
        ),
      ),
    );
  }

  Widget buildRadioButton(int value, String title) {
    return Expanded(
      child: RadioListTile(
        contentPadding: const EdgeInsets.all(8),
        onChanged: (value) {
          setState(() {
            isGSTRegistered = value!;
          });
        },
        value: value,
        groupValue: isGSTRegistered,
        activeColor: ColorCode.colorPrimaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isGSTRegistered == value
                ? ColorCode.colorPrimaryColor
                : ColorCode.colorGrey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        selected: isGSTRegistered == value,
        title: Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }

  Widget buildGSTNumberField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "GST Number",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: textEditingController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 18, color: ColorCode.colorBlack),
          onChanged: (value) {
            if (value.length == 15) setState(() {});
          },
          decoration: InputDecoration(
            hintText: "Eg: 22AAAAA0000A1Z5",
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorCode.colorPrimaryColor,
                width: 2,
              ),
            ),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'[0-9A-Z]'),
            ),
            LengthLimitingTextInputFormatter(15)
            // FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ],
    );
  }
}
