import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/widget/card_restaurant.dart';
import '../../utils/result_state.dart';

class RestaurantFavoritePage extends StatefulWidget {
  static const favoritesTitle = 'Favorite Restaurants';
  const RestaurantFavoritePage({super.key});

  @override
  State<RestaurantFavoritePage> createState() => _RestaurantFavoritePageState();
}

class _RestaurantFavoritePageState extends State<RestaurantFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(RestaurantFavoritePage.favoritesTitle),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: provider.favorites.length,
              itemBuilder: (context, index) {
                return CardRestaurant(restaurant: provider.favorites[index]);
              },
            );
          } else if (provider.state == ResultState.noData) {
            return Center(child: Text(provider.message));
          } else if (provider.state == ResultState.error) {
            return Center(child: Text(provider.message));
          } else {
            return const Center(child: Text('Please try again later'));
          }
        },
      ),
    );
  }
}
