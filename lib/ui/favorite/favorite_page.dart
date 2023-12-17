import 'package:flutter/material.dart';

class RestaurantFavoritePage extends StatefulWidget {
  const RestaurantFavoritePage({super.key});

  @override
  State<RestaurantFavoritePage> createState() => _RestaurantFavoritePageState();
}

class _RestaurantFavoritePageState extends State<RestaurantFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favorite Page'),
      ),
    );
  }
}
