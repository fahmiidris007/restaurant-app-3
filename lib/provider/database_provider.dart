import 'package:flutter/material.dart';
import 'package:restaurant_app/data/db/database_helper.dart';

import '../data/model/restaurant.dart';
import '../utils/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  late final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    getFavorites();
  }

  late ResultState _state;

  ResultState get state => _state;
  String _message = '';

  String get message => _message;

  List<Restaurant> _favorites = [];

  List<Restaurant> get favorites => _favorites;

  void getFavorites() async {
    _state = ResultState.loading;
    notifyListeners();
    _favorites = await databaseHelper.getFavorite();
    if (_favorites.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Favorite Restaurant not found';
    }
    notifyListeners();
  }

  void addFavorite(Restaurant restaurant) async {
    try {
      await databaseHelper.insertFavorite(restaurant);
      getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Add Favorite Restaurant failed';
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String id) async {
    final favoritedRestaurant = await databaseHelper.getFavoriteById(id);
    return favoritedRestaurant.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Remove Favorite Restaurant failed';
      notifyListeners();
    }
  }
}
