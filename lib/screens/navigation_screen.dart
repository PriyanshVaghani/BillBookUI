import 'package:bill_book_ui/screens/dashboard/dashboard_screen.dart';
import 'package:bill_book_ui/screens/items/items_screen.dart';
import 'package:bill_book_ui/screens/parties/parties_screen.dart';
import 'package:bill_book_ui/utility/color_code.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

  List<Widget> navigationScreen = [
    const DashboardScreen(),
    const PartiesScreen(),
    const ItemsScreen(),
    const DashboardScreen(),
    const DashboardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorCode.colorPrimaryColor,
          selectedLabelStyle: TextStyle(
            color: ColorCode.colorPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline), label: "Parties"),
            BottomNavigationBarItem(icon: Icon(Icons.gif_box), label: "Items"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "For You"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "More"),
          ],
        ),
        // body: const DashboardScreen(),
        // body: CustomScrollViewScreen(),
        body: navigationScreen[currentIndex],
      ),
    );
  }
}
