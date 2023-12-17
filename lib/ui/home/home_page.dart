import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/styles.dart';
import 'package:restaurant_app/ui/favorite/favorite_page.dart';
import 'package:restaurant_app/ui/home/list_page.dart';
import 'package:restaurant_app/ui/setting/setting_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavIndex == 0
          ? RestaurantListPage()
          : _bottomNavIndex == 1
              ? RestaurantFavoritePage()
              : SettingPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        selectedItemColor: secondaryColor,
        onTap: (value) {
          setState(() {
            _bottomNavIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
