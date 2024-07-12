import 'package:flutter/material.dart';

class AddKasir extends StatefulWidget {
  const AddKasir({Key? key}) : super(key: key);

  @override
  State<AddKasir> createState() => _AddKasirState();
}

class _AddKasirState extends State<AddKasir> {
  // Controller for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027), // Set scaffold background color
      appBar: AppBar(
        title: Text('Add Kasir', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0700FF), // Set app bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Name', nameController),
            _buildTextField('Email', emailController),
            _buildTextField('Password', passwordController),
            _buildTextField('Phone Number', phoneNumberController),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle tambah (add) action
                  _handleTambah();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0700FF), // Set button background color
                  onPrimary: Colors.white, // Text color
                ),
                child: Text(
                  'Tambah',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white), // Set text color
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white), // Set label color
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xFF0700FF)), // Set input line color
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xFF0700FF)), // Set input line color
          ),
        ),
      ),
    );
  }

  void _handleTambah() {
    // Handle tambah kasir
    print('Name: ${nameController.text}');
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');
    print('Phone Number: ${phoneNumberController.text}');
  }
}
