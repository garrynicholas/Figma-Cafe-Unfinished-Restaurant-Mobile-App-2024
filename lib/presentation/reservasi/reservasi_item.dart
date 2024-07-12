// pesanan_item.dart

class ReservasiItem {
  final String title;
  final double price;
  final String imageAssets;
  int quantity;
  final String? specialRequest;

  ReservasiItem({
    required this.title,
    required this.price,
    required this.imageAssets,
    this.quantity = 1,
    required this.specialRequest,
  });
}
