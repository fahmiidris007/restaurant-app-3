import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:flutter/material.dart';
import '../data/model/restaurant.dart';
import '../utils/result_state.dart';

class DatabaseProvider extends ChangeNotifier{
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
    _favorites = await databaseHelper.getFavorite();
    if (_favorites.length > 0) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavorite(Restaurant restaurant) async {
    try {
      await databaseHelper.insertFavorite(restaurant);
      getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
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
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}