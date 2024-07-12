import 'package:figmacafe/beranda.dart';
import 'package:flutter/material.dart';

class FoodManager extends StatefulWidget {
  const FoodManager({Key? key}) : super(key: key);

  @override
  _FoodManagerState createState() => _FoodManagerState();
}

class _FoodManagerState extends State<FoodManager> {
  Map<String, bool> foodAvailability = {
    "Bread": true,
    "French Fries": true,
    "Fried Rice": true,
    "Croissant": true,
  };

  Map<String, bool> drinkAvailability = {
    "Milk Tea": true,
    "Cookies & Cream": true,
    "Matcha-X": true,
    "Coca Cola": true,
  };

  void showSnackBar(String productName, bool isEnabled) {
    final snackBar = SnackBar(
      content: Text(
        '$productName is ${isEnabled ? 'enabled' : 'disabled'}. Check the result',
        style: TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        label: 'Check',
        onPressed: () {
          // Navigasi ke Beranda ketika action "Periksa" ditekan
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Beranda()),
          );
        },
      ),
      backgroundColor: Color(0xFF0700FF), // Set snackbar background color
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Manager', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0700FF), // Set app bar background color
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          _buildCategoryList('Makanan', foodAvailability),
          _buildCategoryList('Minuman', drinkAvailability),
        ],
      ),
      backgroundColor: Color(0xFF010027), // Set scaffold background color
    );
  }

  Widget _buildCategoryList(String category, Map<String, bool> availability) {
    return Column(
      children: [
        ListTile(
          title: Text(category, style: TextStyle(color: Colors.white)),
        ),
        for (var entry in availability.entries)
          ListTile(
            title: Text(entry.key, style: TextStyle(color: Colors.white)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      availability[entry.key] = true;
                    });
                    showSnackBar(entry.key, true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF), // Set button background color
                  ),
                  child: Text('Enable', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      availability[entry.key] = false;
                    });
                    showSnackBar(entry.key, false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF), // Set button background color
                  ),
                  child: Text('Disable', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
