import 'package:cart/model/shoe.dart';
import 'package:flutter/material.dart';

class ShopNotifier extends ChangeNotifier {
  List<Shoe> cartItems = [];
  List<Shoe> allProducts = [];

  ShopNotifier() {
    init();
  }
  void init() {
    allProducts = shoesList as List<Shoe>;
  }

  List<Shoe> getCart() {
    return cartItems;
  }

  void addToCart(Shoe item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }
}
