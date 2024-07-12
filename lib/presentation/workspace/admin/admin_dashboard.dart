import 'package:flutter/material.dart';
import 'package:figmacafe/presentation/workspace/admin/chat_admin.dart';
import 'package:figmacafe/presentation/workspace/admin/customer_data.dart';
import 'package:figmacafe/presentation/workspace/admin/kasir_data.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027),
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0700FF),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Tools',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle action ketika button "Data Pelanggan" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerData(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Data Pelanggan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle action ketika button "Data Kasir" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KasirData(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Data Kasir',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle action ketika button "Chat" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatAdmin(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Chat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
