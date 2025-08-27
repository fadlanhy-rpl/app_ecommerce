import 'package:app_ecommerce/preferences/preferences.dart';
import 'package:app_ecommerce/screens/screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [HomePage(),TrendingProduct(), DetailProduct() ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       selectedIndex = index;
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
      //   ],
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        height: 60,
        backgroundColor: MainColors.whiteColor,
        buttonBackgroundColor: Colors.blueAccent,
        color: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: MainColors.whiteColor),
          Icon(Icons.shopping_cart, size: 30, color: MainColors.whiteColor),
          Icon(Icons.favorite, size: 30, color: MainColors.whiteColor),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      

    );
  }
}
