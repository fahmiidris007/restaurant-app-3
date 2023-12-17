import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/list_restaurant_provider.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/search_restaurant_provider.dart';
import 'package:restaurant_app/theme/styles.dart';
import 'package:restaurant_app/ui/detail/detail_page.dart';
import 'package:restaurant_app/ui/home/home_page.dart';
import 'package:restaurant_app/ui/home/list_page.dart';
import 'package:restaurant_app/ui/post_review/post_review_page.dart';
import 'package:restaurant_app/ui/search/search_page.dart';
import 'package:restaurant_app/ui/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api/api_service.dart';
import 'data/preferences/preferences_helper.dart';
import 'provider/detail_restaurant_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListRestaurantProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchRestaurantProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailRestaurantProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Restaurant App',
            theme: provider.themeData,
            home: const SplashScreen(),
            routes: {
              HomePage.routeName: (context) => const HomePage(),
              RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
                    restaurantId:
                        ModalRoute.of(context)?.settings.arguments as String,
                  ),
              SearchPage.routeName: (context) => const SearchPage(),
              PostReviewPage.routeName: (context) => PostReviewPage(
                    id: ModalRoute.of(context)?.settings.arguments as String,
                  ),
            },
          );
        },
      ),
    );
  }
}
