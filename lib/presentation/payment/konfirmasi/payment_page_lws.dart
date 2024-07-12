import 'package:figmacafe/presentation/payment/payment_auth/lawson_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PaymentLws extends StatefulWidget {
  final double amount;

  PaymentLws({required this.amount});

  @override
  _PaymentLwsState createState() => _PaymentLwsState();
}

class _PaymentLwsState extends State<PaymentLws> {
  String authenticationCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konfirmasi Pembayaran',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF010027),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF010027),
              Color(0xFF0700FF),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 146, 54),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Total Pembelian: Rp.${widget.amount.toString()}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Pilihan Metode Pembayaran:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF010027),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Improved UI for the supermarket section
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.store,
                            size: 40.0,
                            color: Color(0xFF0700FF),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lawson Supermarket',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF010027),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Pergi langsung ke Lawson untuk melakukan pembayaran.',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Simulate the purchase process and generate a random authentication code
                        setState(() {
                          authenticationCode = _generateRandomCode();
                        });

                        // Navigate to the supermarket authentication page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LawsonAuth(authenticationCode),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0700FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Beli Saldo',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
      ),
    );
  }

  String _generateRandomCode() {
    const String characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();
    String code = '';

    for (int i = 0; i < 12; i++) {
      code += characters[random.nextInt(characters.length)];
    }

    return code;
  }
}
