import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/main.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/ui/detail/detail_page.dart';
import 'package:restaurant_app/ui/favorite/favorite_page.dart';
import 'package:restaurant_app/ui/home/list_page.dart';
import 'package:restaurant_app/ui/setting/setting_page.dart';
import 'package:restaurant_app/utils/notification_helper.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
    _notificationHelper.configureSelectNotificationSubject(
        context, RestaurantDetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PreferencesProvider>(context).themeData;
    return Scaffold(
      body: _bottomNavIndex == 0
          ? const RestaurantListPage()
          : _bottomNavIndex == 1
              ? const RestaurantFavoritePage()
              : const SettingPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        selectedItemColor: theme.colorScheme.secondary,
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
