import 'package:flutter/material.dart';

class CartProduct {
  final String id;
  final String imgPath;
  final String name;
  final double price;
  final double totalAmount;
  final int quantity;

  CartProduct({
    required this.id,
    required this.imgPath,
    required this.name,
    required this.price,
    required this.totalAmount,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  final Map<String, CartProduct> _items = {};

  Map<String, CartProduct> get items {
    return {..._items};
  }

  void addProduct({
    required String id,
    required String imgPath,
    required String name,
    required double price,
  }) {
    if (_items.isEmpty) {
      _items.putIfAbsent(
        id,
        () => CartProduct(
          id: id,
          imgPath: imgPath,
          name: name,
          price: price,
          totalAmount: price,
          quantity: 1,
        ),
      );
    } else {
      _items.update(
        id,
        (item) => CartProduct(
          id: item.id,
          imgPath: item.imgPath,
          name: item.name,
          price: item.price,
          totalAmount: item.quantity * item.price,
          quantity: item.quantity + 1,
        ),
      );
    }
    notifyListeners();
  }
}
