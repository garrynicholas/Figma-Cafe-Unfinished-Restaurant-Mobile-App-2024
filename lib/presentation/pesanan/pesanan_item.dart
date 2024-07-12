// pesanan_item.dart
// pesanan item untuk deklarasi dan konstruktor

class CartItem {
  final String title;
  final double price;
  final String imageAssets;
  int quantity;
  final String? specialRequest;

  CartItem({
    required this.title,
    required this.price,
    required this.imageAssets,
    this.quantity = 1,
    required this.specialRequest,
  });
}
