import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String? id;
  final String? imgPath;
  final String? name;
  final String? color;
  final String? description;
  final double? price;
  final double? grade;
  final int? reviews;
  bool isFavorited;
  bool isRecentlyViewed;

  Product({
    this.id,
    this.imgPath,
    this.name,
    this.color,
    this.description,
    this.price,
    this.grade,
    this.reviews,
    this.isFavorited = false,
    this.isRecentlyViewed = false,
  });

  void toggleFavoriteStatus() {
    isFavorited = !isFavorited;
    notifyListeners();
  }
}
