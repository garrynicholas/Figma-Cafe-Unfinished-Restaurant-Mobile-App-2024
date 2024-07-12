import 'package:figmacafe/presentation/payment/konfirmasi/payment_page_lws.dart';

import 'package:flutter/material.dart';

class TambahSaldoLawson extends StatefulWidget {
  @override
  _TambahSaldoLawsonState createState() => _TambahSaldoLawsonState();
}

class _TambahSaldoLawsonState extends State<TambahSaldoLawson> {
  double selectedAmount = 50000.0; // Initial value
  double availableBalance = 100000.0; // Example value for available balance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Saldo',
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
            colors: [Color(0xFF010027), Color(0xFF0700FF)],
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
                    Text(
                      'Pilih Jumlah Saldo:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF010027),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButton<double>(
                            isExpanded: true,
                            value: selectedAmount,
                            onChanged: (value) {
                              setState(() {
                                selectedAmount = value!;
                              });
                            },
                            items: [50000.0, 100000.0, 150000.0]
                                .map<DropdownMenuItem<double>>((double value) {
                              return DropdownMenuItem<double>(
                                value: value,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rp.${value.toString()}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 10.0),
                          // Small text for "Saldo Tersedia"
                          Text(
                            'Saldo Tersedia: Rp.${availableBalance.toString()}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          // Text for "Biaya Transfer"
                          Text(
                            'Biaya Transfer: Rp.0',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Pilih Metode Pembayaran:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF010027),
                      ),
                    ),

                    // Row with buttons for Indomaret, Alfamart, and Lawson
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildLogoButton('assets/images/lawson.png'),
                      ],
                    ),

                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the payment page when the button is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PaymentLws(amount: selectedAmount),
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
                              Icons.payment,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Lanjutkan Pembayaran',
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

  Widget _buildLogoButton(String imagePath) {
    return SizedBox(
      width: 80.0,
      height: 80.0,
      child: GestureDetector(
        onTap: () {
          // Add your logic for Indomaret image click here
          print('Lawson image clicked');
        },
        child: Image.asset(
          imagePath,
          width: 80.0,
          height: 80.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
