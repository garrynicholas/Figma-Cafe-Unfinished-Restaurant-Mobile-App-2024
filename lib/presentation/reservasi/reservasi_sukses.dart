// order_success_page.dart

import 'package:figmacafe/beranda.dart';
import 'package:flutter/material.dart';

class PesananSukses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Image.asset(
                  'assets/images/success.png', // Replace with your image path
                  width: 250.0,
                  height: 250.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Pesanan Sukses!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Pesananmu telah berhasil diproses.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home page (Beranda)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beranda()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0700FF), // Set button background color
                onPrimary: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: Text(
                'Kembali ke Beranda',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
