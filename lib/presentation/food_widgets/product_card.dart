import 'package:figmacafe/beranda.dart';
import 'package:figmacafe/presentation/food_widgets/product_detail.dart';
import 'package:figmacafe/presentation/pesanan/pesanan_item.dart';
import 'package:figmacafe/presentation/pesanan/pesanan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageAssets;
  final double price;
  final bool isAvailable;
  final Function(String, bool) updateAvailability;
  final String? typeFood;
  final String? calories;
  final String? waitTime;

  // parameter adalah nilai atau objek yang dapat disertakan saat memanggil suatu fungsi atau konstruktor
  // const = metode khusus yang digunakan untuk menginisialisasi objek saat objek tersebut dibuat
  // const tidak mengembalikan nilai
  // ketika menggunakan required di depan parameter pada konstruktor, itu biasanya menandakan bahwa nilai untuk parameter tersebut harus disediakan saat membuat objek kelas
  const ProductCard({
    Key? key,
    required this.title, //parameter
    required this.description,
    required this.imageAssets,
    required this.price,
    required this.isAvailable,
    required this.updateAvailability,
    this.typeFood,
    this.calories,
    this.waitTime,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isWishlistClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              /* title: widget.title: Menyampaikan nilai dari atribut title pada 
              ProductCard ke atribut title pada ProductDetailPage */
              title: widget.title,
              description: widget.description,
              price: widget.price,
              imageAssets: widget.imageAssets,
              isAvailable: widget.isAvailable,
              updateAvailability: widget.updateAvailability,
              typeFood: widget.typeFood,
              calories: widget.calories,
              waitTime: widget.waitTime,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Rounded top image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              // widget Stack digunakan untuk menumpuk atau menempatkan beberapa widget di atas satu sama lain
              child: Stack(
                children: [
                  Image.asset(
                    widget.imageAssets,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Stock status berada di kiri atas dalam gambar
                  Positioned(
                    top: 14.0,
                    left: 14.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.isAvailable ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: Text(
                        widget.isAvailable ? 'Available' : 'Out of stock',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  // Wishlist love button di kanan atas dalam gambar
                  // Positioned(
                  //   top: 2.0,
                  //   right: 2.0,
                  //   child: IconButton(
                  //     icon: Icon(
                  //       Icons.favorite,
                  //       color: isWishlistClicked ? Colors.red : Colors.white,
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         isWishlistClicked = !isWishlistClicked;
                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
            // Content bawah gambar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product title
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'ModernFont', // ganti font
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    widget.description,
                    maxLines: 2, // Set max baris text
                    overflow: TextOverflow.ellipsis, // ellipsis jika overflowed
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'ModernFont', // ganti font
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  // Product price di bagian kiri
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      /* mengambil nilai dari atribut price, mengubah nilai harga jadi integer, convert nilai integer ke 
                      string, menambahkan huruf K untuk indikasi bahwa nilai display sebagai harga */
                      '${widget.price.toInt().toString()}K',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                        fontFamily: 'ModernFont', // Change to your desired font
                      ),
                    ),
                  ),
                  SizedBox(height: 6.0),
                  // SizedBox(height: 8.0),
                  // // Beautiful blue "Pesan" button
                  // ElevatedButton(
                  //   onPressed: widget.isAvailable
                  //       ? () {
                  //           CartProvider cartProvider =
                  //               Provider.of<CartProvider>(context,
                  //                   listen: false);

                  //           if (cartProvider.cartItems
                  //               .any((item) => item.title == widget.title)) {
                  //             ScaffoldMessenger.of(context).showSnackBar(
                  //               SnackBar(
                  //                 content: Text(
                  //                     '${widget.title} sudah ditambahkan di pesananmu'),
                  //                 action: SnackBarAction(
                  //                   label: 'Lihat',
                  //                   onPressed: () {
                  //                     Navigator.pushNamed(context, '/order');
                  //                   },
                  //                 ),
                  //               ),
                  //             );
                  //           } else {
                  //             if (widget.isAvailable) {
                  //               CartItem item = CartItem(
                  //                 title: widget.title,
                  //                 price: widget.price,
                  //               );
                  //               cartProvider.addToCart(item);

                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                 SnackBar(
                  //                   content: Text(
                  //                       '${widget.title} ditambahkan di pesananmu'),
                  //                   action: SnackBarAction(
                  //                     label: 'Lihat',
                  //                     onPressed: () {
                  //                       Navigator.pushNamed(context, '/order');
                  //                     },
                  //                   ),
                  //                 ),
                  //               );

                  //               widget.updateAvailability(widget.title, false);
                  //             } else {
                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                 SnackBar(
                  //                   content: Text(
                  //                       '${widget.title} tidak tersedia, coba item lain'),
                  //                 ),
                  //               );
                  //             }
                  //           }
                  //         }
                  //       : null,
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Color(0xFF0700FF),
                  //     onPrimary: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     minimumSize: Size(double.infinity, 40.0),
                  //   ),
                  //   child: Text(
                  //     'PESAN',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
