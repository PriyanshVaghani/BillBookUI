import 'package:bill_book_ui/model/industry_type_model.dart';
import 'package:bill_book_ui/model/subindustry_type_model.dart';
import 'package:bill_book_ui/screens/login_register/gst_registration_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/utility/const_list.dart';
import 'package:flutter/material.dart';

import '../../widgets/single_floating_button_widget.dart';

class SelectIndustry extends StatefulWidget {
  const SelectIndustry({super.key});

  @override
  State<SelectIndustry> createState() => _SelectIndustryState();
}

class _SelectIndustryState extends State<SelectIndustry> {
  int selectedIndustry = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Select Industry",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "It helps us customize app according to your industry",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SearchBar(
                backgroundColor: MaterialStateProperty.all(
                  ColorCode.colorGrey.withOpacity(0.5),
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                leading: const Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: "Search Industry",
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: listTypeOfIndustry.length,
                itemBuilder: (context, index) {
                  IndustryType industryType = listTypeOfIndustry[index];
                  return Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              industryType.type,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                      ListView.separated(
                        itemCount: industryType.subIndustryDetails.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          SubIndustryType sunIndustryType =
                              industryType.subIndustryDetails[index];
                          return RadioListTile(
                            onChanged: (value) {
                              setState(() {
                                selectedIndustry = value!;
                              });
                            },
                            groupValue: selectedIndustry,
                            value: sunIndustryType.id,
                            title: Text(sunIndustryType.title),
                            subtitle: Text(sunIndustryType.subtitle),
                            controlAffinity: ListTileControlAffinity.trailing,
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SingleFloatingButtonWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GSTRegistration(),
              ),
            );
          },
        ),
      ),
    );
  }
}
