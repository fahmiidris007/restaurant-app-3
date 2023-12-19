import 'package:flutter/material.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';
import 'package:restaurant_app/theme/styles.dart';

class PreferencesProvider extends ChangeNotifier {
  late PreferencesHelper preferencesHelper;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailyRestaurantPreferences();
    _getDarkThemePreferences();
  }

  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  bool _isRestaurantDailyActive = false;

  bool get isRestaurantDailyActive => _isRestaurantDailyActive;

  void _getDarkThemePreferences() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyRestaurantPreferences() async {
    _isRestaurantDailyActive = await preferencesHelper.isDailyRestaurantActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getDarkThemePreferences();
  }

  void enableDailyRestaurant(bool value) {
    preferencesHelper.setDailyRestaurant(value);
    _getDailyRestaurantPreferences();
  }
}
