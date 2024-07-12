import 'package:figmacafe/presentation/workspace/kasir/contact_admin.dart';
import 'package:figmacafe/presentation/workspace/kasir/customer_order.dart';
import 'package:figmacafe/presentation/workspace/kasir/food_manager.dart';
import 'package:flutter/material.dart';

class KasirDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0700FF),
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
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
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Handle action ketika button "Customer Order" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerOrderPage()),
                    );
                  },
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Customer Order',
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
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Handle action ketika button "Kontak Admin" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodManager()),
                    );
                  },
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'F&B Manager',
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
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Handle action ketika button "Kontak Admin" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactAdmin()),
                    );
                  },
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Kontak Admin',
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
