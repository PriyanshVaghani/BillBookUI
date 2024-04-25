import 'package:bill_book_ui/screens/parties/add_parties_from_contacts_screen.dart';
import 'package:bill_book_ui/widgets/category_chip_widget.dart';
import 'package:bill_book_ui/widgets/double_floating_button_widget.dart';
import 'package:bill_book_ui/widgets/filter_chip_widget.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:bill_book_ui/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class PartiesScreen extends StatefulWidget {
  const PartiesScreen({super.key});

  @override
  State<PartiesScreen> createState() => _PartiesScreenState();
}

class _PartiesScreenState extends State<PartiesScreen> {
  // 0 - to pay, 1 - to collect
  int selectedOption = -1;
  bool isCategory = false, isSearch = false;

  setIsSearch() {
    setState(() {
      isSearch = !isSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorCode.colorPrimaryColor.withOpacity(0.1),
          appBar: AppBar(
            title: isSearch
                ? buildIsSearchTrue(
                    setIsSearch) // when search is true then it display search filed
                : buildIsSearchFalse(
                    setIsSearch), // else it display title and search icon
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: ColorCode.colorPrimaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: ColorCode.colorPrimaryColor,
                ),
              ),
            ],
            // display chip of filtering
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: SizedBox(
                height: 50,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildToPayOrCollectChip("To Pay", 0),
                    const SizedBox(width: 12),
                    buildToPayOrCollectChip("To Collect", 1),
                    const SizedBox(width: 12),
                    const CategoryChipWidget(),
                    const SizedBox(width: 12),
                    const FilterChipWidget(),
                  ],
                ),
              ),
            ),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  title: const Text(
                    "Abc",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text("Customer"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        size: 15,
                        color: ColorCode.colorBlack,
                      ),
                      const Text(
                        "100",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        size: 15,
                        color: ColorCode.colorRed,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: DoubleFloatingButtonWidget(
            onPressed2: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AddPartiesFromContactsScreen()));
            },
          )),
    );
  }

  Widget buildToPayOrCollectChip(String title, int index) {
    bool isSelected = selectedOption == index;
    return FilterChip(
      backgroundColor: ColorCode.colorWhite,
      selectedColor: ColorCode.colorPrimaryColor.withOpacity(0.2),
      label: isSelected
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title),
                const SizedBox(width: 5),
                const Icon(Icons.cancel),
              ],
            )
          : Text(title),
      showCheckmark: false,
      selected: isSelected,
      shape: const StadiumBorder(),
      onSelected: (bool value) {
        setState(() {
          if (value) {
            selectedOption = index;
          } else {
            selectedOption = -1;
          }
        });
      },
    );
  }
}
