import 'package:bill_book_ui/screens/login_register/select_industry_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/utility/const_list.dart';
import 'package:bill_book_ui/widgets/single_floating_button_widget.dart';
import 'package:flutter/material.dart';

class SelectTypeOfBusinessScreen extends StatefulWidget {
  const SelectTypeOfBusinessScreen({super.key});

  @override
  State<SelectTypeOfBusinessScreen> createState() =>
      _SelectTypeOfBusinessScreenState();
}

class _SelectTypeOfBusinessScreenState
    extends State<SelectTypeOfBusinessScreen> {
  List<String> selectedBusiness = [];
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
                  "Select Type of Business",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: listTypeOfBusiness.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      contentPadding: const EdgeInsets.all(8),
                      onChanged: (value) {
                        setState(() {
                          if (value ?? false) {
                            selectedBusiness.add(listTypeOfBusiness[index]);
                          } else {
                            selectedBusiness.remove(listTypeOfBusiness[index]);
                          }
                        });
                      },
                      value:
                          selectedBusiness.contains(listTypeOfBusiness[index]),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: ColorCode.colorPrimaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: selectedBusiness
                                  .contains(listTypeOfBusiness[index])
                              ? ColorCode.colorPrimaryColor
                              : ColorCode.colorGrey,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text(
                        listTypeOfBusiness[index],
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
          onPressed: selectedBusiness.isEmpty
              ? null
              : () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectIndustry()));
                },
        ),
      ),
    );
  }
}
