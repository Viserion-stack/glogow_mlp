import 'package:flutter/foundation.dart';

class Article with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final DateTime addedAt;
  final String imageUrl;
  final String category;
  final String articleUrl;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.addedAt,
    required this.imageUrl,
    required this.articleUrl,
    required this.category,
  });

  //void toggleFavoriteStatus() {}
}
