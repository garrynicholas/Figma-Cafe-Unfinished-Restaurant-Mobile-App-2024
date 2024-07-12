import 'package:figmacafe/presentation/order.dart';
import 'package:figmacafe/presentation/pesanan/pesanan_item.dart';
import 'package:figmacafe/presentation/pesanan/pesanan_provider.dart';
import 'package:figmacafe/presentation/reservasi/reservasi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String imageAssets;
  final bool isAvailable;
  final Function(String, bool) updateAvailability;
  final String? typeFood;
  final String? calories;
  final String? waitTime;

  const ProductDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageAssets,
    required this.isAvailable,
    required this.updateAvailability,
    required this.typeFood,
    required this.calories,
    required this.waitTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Food Image with Back Arrow
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageAssets),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Back Arrow
              // Back Arrow
              Positioned(
                top: 30.0,
                left: 20.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black, // Set the arrow color to black
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          // Food Detail Information
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 57, 50, 255),
                    Color.fromARGB(255, 245, 245, 245)
                  ],
                  stops: [0.0, 0.7],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        // mengambil nilai dari atribut price ke bilangan integer ke string dengan huruf K
                        '${price.toInt().toString()}K',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 10, 241, 17),
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  // Details (Type, Calories, Wait Time)
                  // widget, parameter
                  // parameter nilai yang dapat memanggil fungsi / konstruktor
                  _buildDetailItem(typeFood, calories, waitTime),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black87,
                        fontFamily: 'Roboto Serif',
                      ),
                      maxLines: 6, // Set max baris teks
                      overflow: TextOverflow
                          .ellipsis, // Handle overflow dengan ellipsis
                    ),
                  ),
                  // Spacer untuk push content ke atas
                  Spacer(),
                  SizedBox(height: 20.0),
                  // Align dengan Love dan button Pesan
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          // // Love button (20%)
                          // Expanded(
                          //   flex: 3, // 20% of the width
                          //   child: ElevatedButton(
                          //     onPressed: () {},
                          //     style: ElevatedButton.styleFrom(
                          //       primary: Colors.red,
                          //       onPrimary: Colors.white,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(12.0),
                          //       ),
                          //       elevation: 0,
                          //       minimumSize: Size(double.infinity, 50.0),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(Icons.favorite),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Spacer to create space between buttons
                          // SizedBox(width: 8.0),
                          // Pesan button (80%)
                          Expanded(
                            flex: 8, // 80% of the width
                            child: ElevatedButton(
                              onPressed: isAvailable
                                  ? () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                          ),
                                        ),
                                        builder: (BuildContext context) {
                                          return Container(
                                            height:
                                                355, // Set height bottom sheet
                                            child: Column(
                                              children: [
                                                // Image dgn overlay
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      height: 170,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  16),
                                                          topRight:
                                                              Radius.circular(
                                                                  16),
                                                        ),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/ordersheet2.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 15,
                                                      child: Container(
                                                        height: 3,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  2), // Adjust radius for rounding
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Title
                                                      Text(
                                                        'Pilih Pesanan',
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),

                                                      // Description
                                                      Text(
                                                        'Kamu bisa pesan secara Online atau Reservasi di restoran kami',
                                                        style: TextStyle(
                                                          fontSize: 13.5,
                                                          color: Color.fromARGB(
                                                              255,
                                                              109,
                                                              109,
                                                              109),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      SizedBox(
                                                          height:
                                                              32), // tambah space antara description and buttons
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          // Your first button
                                                          Expanded(
                                                            child: TextButton(
                                                              onPressed:
                                                                  isAvailable
                                                                      ? () {
                                                                          if (isAvailable) {
                                                                            /* Mengambil instance dari CartProvider dari Provider untuk mengelola cart */
                                                                            CartProvider
                                                                                cartProvider =
                                                                                Provider.of<CartProvider>(context, listen: false);
                                                                            // Statement true = return message, false = add cart
                                                                            /* Jika ada setidaknya satu item dalam cart (cartProvider.cartItems) yang 
                                                                            memiliki title yang sama dengan title yang diberikan / duplicate cart item, maka return message */
                                                                            if (cartProvider.cartItems.any((item) =>
                                                                                item.title ==
                                                                                title)) {
                                                                              // Item sudah ada di cart
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text('$title sudah ada dalam pesananmu'),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              //Menambahkan item ke cart
                                                                              CartItem item = CartItem(
                                                                                title: title,
                                                                                price: price,
                                                                                imageAssets: imageAssets,
                                                                                specialRequest: "",
                                                                              );
                                                                              cartProvider.addToCart(item);

                                                                              // Update availability
                                                                              updateAvailability(title, false);

                                                                              // Show success message
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text('$title ditambahkan dipesananmu'),
                                                                                ),
                                                                              );
                                                                            }

                                                                            // Close the screen if possible
                                                                            /* Navigator.canPop(context) adalah metode yang digunakan untuk 
                                                                            menentukan apakah ada halaman sebelumnya yang dapat ditarik (pop) dari tumpukan navigasi */
                                                                            if (Navigator.canPop(context)) {
                                                                              Navigator.pop(context);
                                                                            }
                                                                          }
                                                                        }
                                                                      : null,
                                                              child: Container(
                                                                height: 35,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  'Pesan Online',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                              style: TextButton
                                                                  .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0700FF),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          // Spacer between buttons
                                                          SizedBox(width: 16),
                                                          // Your second button
                                                          Expanded(
                                                            child: TextButton(
                                                              onPressed:
                                                                  isAvailable
                                                                      ? () {
                                                                          ReservasiProvider
                                                                              reservasiProvider =
                                                                              Provider.of<ReservasiProvider>(context, listen: false);

                                                                          if (reservasiProvider.reservasiItems.any((item) =>
                                                                              item.title ==
                                                                              title)) {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text('${title} sudah ditambahkan di pesanan reservasimu'),
                                                                              ),
                                                                            );
                                                                            Navigator.pop(context);
                                                                          } else {
                                                                            if (isAvailable) {
                                                                              CartItem item = CartItem(
                                                                                title: title,
                                                                                price: price,
                                                                                imageAssets: imageAssets,
                                                                                specialRequest: "",
                                                                              );
                                                                              reservasiProvider.addToReservasi(item);

                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text('${title} ditambahkan di pesanan reservasimu'),
                                                                                ),
                                                                              );

                                                                              updateAvailability(title, false);
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text('${title} tidak tersedia, coba item lain'),
                                                                                ),
                                                                              );
                                                                            }

                                                                            // Close the screen if possible
                                                                            if (Navigator.canPop(context)) {
                                                                              Navigator.pop(context);
                                                                            }
                                                                          }
                                                                        }
                                                                      : null,
                                                              child: Container(
                                                                height: 35,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  'Buat Reservasi',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                              style: TextButton
                                                                  .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0700FF),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF0700FF),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 0,
                                minimumSize: Size(double.infinity, 50.0),
                              ),
                              child: Text(
                                'PESAN',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String? type, String? calories, String? waitTime) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 0.0), // Adjust the padding as needed
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Adjust the alignment as needed
        children: [
          _buildDetailItemRow('Tipe', type ?? 'N/A'),
          _buildVerticalLine(),
          _buildDetailItemRow('Kalori', calories ?? 'N/A Kcal'),
          _buildVerticalLine(),
          _buildDetailItemRow('Waktu', waitTime ?? 'N/A Mins'),
        ],
      ),
    );
  }

  Widget _buildVerticalLine() {
    return Container(
      height: 40.0, // Adjust the height as needed
      width: 1.0,
      color: Colors.white,
    );
  }

  Widget _buildDetailItemRow(String label, String value) {
    return Expanded(
      child: Center(
        // RichText digunakan untuk menampilkan teks dengan gaya yang berbeda-beda
        child: RichText(
          textAlign: TextAlign.center,
          /* TextSpan untuk membuat teks yang lebih kompleks dengan berbagai gaya,
          seperti penggunaan font yang berbeda, warna teks yang berbeda */
          text: TextSpan(
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: "Helvetica",
            ),
            children: [
              TextSpan(
                text: '$label\n',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(text: value),
            ],
          ),
        ),
      ),
    );
  }
}
