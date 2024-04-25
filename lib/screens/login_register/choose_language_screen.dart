import 'package:bill_book_ui/screens/login_register/login_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/utility/const_list.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:flutter/material.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  int selectedLanguage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose Language",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: listOfLanguage.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      contentPadding: const EdgeInsets.all(8),
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                      value: index,
                      groupValue: selectedLanguage,
                      activeColor: ColorCode.colorPrimaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: selectedLanguage == index
                              ? ColorCode.colorPrimaryColor
                              : ColorCode.colorGrey,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      selected: selectedLanguage == index,
                      title: Text(
                        listOfLanguage[index],
                        style: const TextStyle(fontSize: 22),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SingleFloatingButtonWidget(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        ),
      ),
    );
  }
}
