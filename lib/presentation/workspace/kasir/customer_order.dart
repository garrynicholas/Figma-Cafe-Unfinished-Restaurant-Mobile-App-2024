import 'package:flutter/material.dart';

class CustomerOrderPage extends StatefulWidget {
  const CustomerOrderPage({Key? key}) : super(key: key);

  @override
  State<CustomerOrderPage> createState() => _CustomerOrderPageState();
}

class _CustomerOrderPageState extends State<CustomerOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027),
      appBar: AppBar(
        title: Text('Order Pelanggan', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0700FF), // Set app bar background color
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: Color(0xFF020049),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('Nama Customer', 'John Doe'),
                _buildFoodList('Food List', [
                  {'name': 'Pizza', 'quantity': 4},
                  {'name': 'Burger', 'quantity': 2},
                  {'name': 'Salad', 'quantity': 5},
                ]),
                _buildDetailRow('Cabang', 'Figma Cafe Pasuruan'),
                _buildDetailRow('Lokasi', 'Pasuruan'),
                _buildDetailRow('Reservasi', 'Yes'),
                _buildDetailRow('Nomor Reservasi', '3'),
                _buildDetailRow('Tanggal', '2023-11-15'),
                _buildDetailRow('Waktu', '15:30'),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle delete action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Hapus'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle accept action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Terima'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 4.0),
        Text(value, style: TextStyle(color: Colors.white)),
        Divider(color: Colors.white),
      ],
    );
  }

  Widget _buildFoodList(String label, List<Map<String, dynamic>> foods) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 4.0),
        Column(
          children: foods.map((food) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(food['name'], style: TextStyle(color: Colors.white)),
                  Text(
                    'Kuantitas: ${food['quantity']}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        Divider(color: Colors.white),
      ],
    );
  }
}
