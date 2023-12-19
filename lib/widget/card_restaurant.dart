import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/ui/detail/detail_page.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  static const urlImage = 'https://restaurant-api.dicoding.dev/images/small/';

  const CardRestaurant({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PreferencesProvider>(context).themeData;
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
            future: provider.isFavorite(restaurant.id),
            builder: (context, snapshot) {
              var isFavorite = snapshot.data ?? false;
              return Material(
                color: theme.colorScheme.primary,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  leading: Hero(
                    tag: restaurant.pictureId,
                    child: Image.network(
                      urlImage + restaurant.pictureId,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    restaurant.name,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(width: 5),
                          Flexible(child: Text(restaurant.city)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(width: 5),
                          Text(restaurant.rating.toString()),
                        ],
                      )
                    ],
                  ),
                  trailing: isFavorite
                      ? IconButton(
                          onPressed: () =>
                              provider.removeFavorite(restaurant.id),
                          icon: const Icon(Icons.favorite, color: Colors.red),
                        )
                      : IconButton(
                          onPressed: () => provider.addFavorite(restaurant),
                          icon: const Icon(Icons.favorite_border),
                        ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    RestaurantDetailPage.routeName,
                    arguments: restaurant.id,
                  ),
                ),
              );
            });
      },
    );
  }
}
