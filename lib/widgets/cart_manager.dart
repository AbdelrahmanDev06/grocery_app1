import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String description;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}

class CartManager extends ChangeNotifier {
  CartManager._internal();

  static final CartManager instance = CartManager._internal();

  final List<CartItem> items = [];

  void addItem(String title, String description, double price, String image) {
    final index = items.indexWhere((item) => item.title == title);

    if (index != -1) {
      items[index].quantity++;
    } else {
      items.add(
        CartItem(
          title: title,
          description: description,
          price: price,
          image: image,
        ),
      );
    }

    notifyListeners();
  }

  void increment(int index) {
    items[index].quantity++;
    notifyListeners();
  }

  void decrement(int index) {
    if (items[index].quantity > 1) {
      items[index].quantity--;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  double get total {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
