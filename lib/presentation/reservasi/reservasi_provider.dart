// reservasi_provider.dart

import 'package:figmacafe/presentation/pesanan/pesanan_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservasiProvider extends ChangeNotifier {
  List<CartItem> _reservasiItems = [];

  List<CartItem> get reservasiItems => _reservasiItems;

  // Add an item to the reservasi
  void addToReservasi(CartItem item) {
    _reservasiItems.add(item);
    notifyListeners();
  }

  // Increment the quantity of an item in the reservasi
  void incrementQuantity(String title) {
    CartItem? item = _reservasiItems.firstWhere((item) => item.title == title,
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

  // Get the quantity of an item in the reservasi
  int getQuantity(String title) {
    CartItem? item = _reservasiItems.firstWhere((item) => item.title == title,
        orElse: () => CartItem(
              title: '',
              price: 0,
              imageAssets: '',
              specialRequest: '',
            ));
    return item.title.isNotEmpty ? item.quantity : 0;
  }

  // Decrement the quantity of an item in the reservasi
  void decrementQuantity(String title) {
    CartItem? item = _reservasiItems.firstWhere((item) => item.title == title,
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

  // Clear the entire reservasi
  void clearReservasi() {
    _reservasiItems.clear();
    notifyListeners();
  }

  // Remove an item from the reservasi
  void removeFromReservasi(String title) {
    _reservasiItems.removeWhere((item) => item.title == title);
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
    for (CartItem item in _reservasiItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

  void updateSpecialRequest(String title, String specialRequest) {
    // Find the item in the reservasi and update its special request
    for (int i = 0; i < _reservasiItems.length; i++) {
      if (_reservasiItems[i].title == title) {
        _reservasiItems[i] = CartItem(
          title: _reservasiItems[i].title,
          price: _reservasiItems[i].price,
          imageAssets: _reservasiItems[i].imageAssets,
          // other fields
          specialRequest: specialRequest,
        );
        notifyListeners();
        break;
      }
    }
  }
}
