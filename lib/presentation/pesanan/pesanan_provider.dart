// cart_provider.dart
// A Provider is basically a container or a storage that stores and provides you with state or data
// In Flutter, a "provider" refers to a design pattern and a package that helps manage state in your application

import 'package:figmacafe/presentation/pesanan/pesanan_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  // Menambahkan item ke cart
  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  // Menambah kuantitas dari item ke cart
  void incrementQuantity(String title) {
    CartItem? item = _cartItems.firstWhere((item) => item.title == title,
        orElse: () => CartItem(
              title: '',
              price: 0,
              imageAssets: '',
              specialRequest: '',
            ));
    if (item.title.isNotEmpty) {
      item.quantity++;
      notifyListeners();
    }
  }

  // Mendapatkan kuantitas dari item ke cart
  int getQuantity(String title) {
    CartItem? item = _cartItems.firstWhere((item) => item.title == title,
        orElse: () => CartItem(
              title: '',
              price: 0,
              imageAssets: '',
              specialRequest: '',
            ));
    return item.title.isNotEmpty ? item.quantity : 0;
  }

  // Mengurangi kuantitas dari item ke cart
  void decrementQuantity(String title) {
    CartItem? item = _cartItems.firstWhere((item) => item.title == title,
        orElse: () => CartItem(
              title: '',
              price: 0,
              imageAssets: '',
              specialRequest: '',
            ));
    if (item.title.isNotEmpty && item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }

  // Clear semua cart jika keluar aplikasi
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // Menghapus item dari cart
  void removeFromCart(String title) {
    _cartItems.removeWhere((item) => item.title == title);
    notifyListeners();
  }

  String getTotalPriceFormatted() {
    double totalPrice = getTotalPrice();
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return formatCurrency.format(totalPrice);
  }

  //total the price
  double getTotalPrice() {
    double totalPrice = 0;
    for (CartItem item in _cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

  void updateSpecialRequest(String title, String specialRequest) {
    // Menemukan item di keranjang dan perbarui catatan request
    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].title == title) {
        _cartItems[i] = CartItem(
          title: _cartItems[i].title,
          price: _cartItems[i].price,
          imageAssets: _cartItems[i].imageAssets,
          specialRequest: _cartItems[i].specialRequest,
        );
        notifyListeners();
        break;
      }
    }
  }
}
