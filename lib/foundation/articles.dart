import 'package:flutter/material.dart';
import 'package:glogow_mlp/foundation/article.dart';

class Articles with ChangeNotifier {
  List<Article> _items = [];

  List<Article> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  // List<Article> get favoriteItems {
  //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  // }

  Article findById(String id) {
    return _items.firstWhere((art) => art.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addArticles(List<Article> atricles) {
    _items = atricles;
    //notifyListeners();
  }
}
