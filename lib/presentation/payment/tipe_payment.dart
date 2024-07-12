import 'package:figmacafe/presentation/payment/tambah_saldo/tambah_saldo_alfamaret.dart';
import 'package:figmacafe/presentation/payment/tambah_saldo/tambah_saldo_dana.dart';
import 'package:figmacafe/presentation/payment/tambah_saldo/tambah_saldo_indomaret.dart';
import 'package:figmacafe/presentation/payment/tambah_saldo/tambah_saldo_lawson.dart';
import 'package:figmacafe/presentation/payment/tambah_saldo/tambah_saldo_ovo.dart';
import 'package:figmacafe/presentation/payment/tambah_saldo/tambah_saldo_seabank.dart';
import 'package:flutter/material.dart';

class TipePayment extends StatefulWidget {
  const TipePayment({Key? key}) : super(key: key);

  @override
  State<TipePayment> createState() => _TipePaymentState();
}

class _TipePaymentState extends State<TipePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        title: Text(
          'Tipe Payment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container 1 for Credit Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.fromLTRB(20, 0, 16, 16),
              height: 220, // Set the height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0700FF), Colors.blue],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/worldcard1.png'), // Adjust the image path accordingly
                  fit: BoxFit.cover, // Cover the entire container
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add the image at the top left
                  Image.asset(
                    'assets/images/card1.png', // Adjust the image path accordingly
                    width: 80, // Adjust the width as needed
                    height: 80, // Adjust the height as needed
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo: 150.000',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maks. Saldo: 20.000.000',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40), // Add some space before the full name

                  // Add the full name
                  Text(
                    'GUNAWAN WIDYA NUGRAHA', // Replace with the actual full name
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  SizedBox(height: 0), // Adjust the space as needed
                ],
              ),
            ),
            // Container 2 for Pilih Metode Pembayaran
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),

                  // List of payment method buttons
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        buildPaymentButton(
                            'Indomaret',
                            'assets/images/indomaret.png',
                            TambahSaldoIndomaret()),
                        buildPaymentButton(
                            'Alfamart',
                            'assets/images/alfamart.png',
                            TambahSaldoAlfamaret()),
                        buildPaymentButton('Lawson', 'assets/images/lawson.png',
                            TambahSaldoLawson()),
                        buildPaymentButton('SeaBank',
                            'assets/images/seabank.png', InstruksiSeaBank()),
                        buildPaymentButton(
                            'OVO', 'assets/images/ovo.png', InstruksiSeaBank()),
                        buildPaymentButton('Dana', 'assets/images/dana.png',
                            InstruksiSeaBank()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentButton(
      String buttonText, String logoImage, Widget destinationScreen) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: () {
          // Handle button click
          // Navigate to the specified destination screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          padding: EdgeInsets.all(18),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              logoImage,
              width: 36,
              height: 36,
            ),
            SizedBox(width: 16),
            Text(
              buttonText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
