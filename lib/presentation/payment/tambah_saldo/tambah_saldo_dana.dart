import 'package:figmacafe/presentation/payment/konfirmasi/payment_page_dana.dart';
import 'package:flutter/material.dart';

class TambahSaldoDana extends StatefulWidget {
  @override
  _TambahSaldoDanaState createState() => _TambahSaldoDanaState();
}

class _TambahSaldoDanaState extends State<TambahSaldoDana> {
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
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(), // Disable overscroll effect
        child: Container(
          height: 700,
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
                      // Nomor Rekening Input
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Nomor Rekening',
                          hintText: 'Masukkan nomor rekening kamu',
                        ),
                      ),
                      SizedBox(height: 16),

                      // Container showing information
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Informasi:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Sumber Dana: Dana',
                              // Replace with actual source of funds
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),

                      // Input for Nominal Transfer with a numeric keyboard
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Nominal Transfer',
                          hintText: 'Masukkan nominal',
                        ),
                      ),
                      SizedBox(height: 16),

                      // Pesan (Optional) input
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Pesan (Optional)',
                          hintText: 'Masukkan pesan',
                        ),
                      ),
                      SizedBox(height: 16),

                      // Lanjutkan Pembayaran Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaymentDana(amount: selectedAmount),
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
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
      ),
    );
  }

  Widget _buildLogoButton(String imagePath) {
    return SizedBox(
      width: 90.0,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          // Add your logic for each button
          print('Button pressed: $imagePath');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
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
