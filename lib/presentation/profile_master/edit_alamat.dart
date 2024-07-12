import 'package:figmacafe/presentation/profile_master/alamat.dart';
import 'package:flutter/material.dart';

class EditAlamat extends StatefulWidget {
  const EditAlamat({Key? key}) : super(key: key);

  @override
  _EditAlamatState createState() => _EditAlamatState();
}

class _EditAlamatState extends State<EditAlamat> {
  TextEditingController _alamatCustomerController = TextEditingController();
  TextEditingController _alamatRestoranController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Edit Alamat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEditSection(
              'Alamat Customer',
              Icons.person,
              _alamatCustomerController,
            ),
            SizedBox(height: 24.0),
            _buildEditSection(
              'Alamat Restoran',
              Icons.restaurant,
              _alamatRestoranController,
            ),
            SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showConfirmationDialog();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0700FF),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditSection(
    String title,
    IconData icon,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Color(0xFF0700FF),
              size: 24.0,
            ),
            SizedBox(width: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0700FF),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
          style: TextStyle(fontSize: 16.0, color: Colors.black87),
          decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(color: Colors.grey[700]),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[700]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[700]!, width: 2.0),
            ),
          ),
        ),
      ],
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text(
            'Apakah kamu yakin ingin mengubah alamatmu?',
            style: TextStyle(fontSize: 16.0),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _saveEditedAddresses();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Alamat()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0700FF),
                onPrimary: Colors.white,
              ),
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _saveEditedAddresses() {
    // Implement the logic to save the edited addresses
    String alamatCustomer = _alamatCustomerController.text;
    String alamatRestoran = _alamatRestoranController.text;

    // Add your logic to save these addresses (e.g., update in a database)
    // ...
  }
}
