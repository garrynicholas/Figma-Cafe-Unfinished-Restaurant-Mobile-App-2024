import 'package:figmacafe/presentation/profile_master/edit_profile.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class InformasiProfile extends StatefulWidget {
  const InformasiProfile({Key? key}) : super(key: key);

  @override
  State<InformasiProfile> createState() => _InformasiProfileState();
}

class _InformasiProfileState extends State<InformasiProfile> {
  String username = 'Twizzy';
  String email = 'user@gmail.com';
  String password = '********'; // Replace with password masking logic
  String phoneNumber = '+6289699642764';

  // Variable to store the selected image
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f5f9),
      appBar: AppBar(
        title: Text(
          'Informasi Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Color(0xFFf3f5f9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _showImageSelectionDialog(context);
              },
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!) as ImageProvider<Object>?
                    : AssetImage('assets/images/better.png'),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Tap to change image',
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
            SizedBox(height: 24.0),
            _buildProfileInfo(),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0700FF),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(double.infinity, 50.0),
              ),
              child: Text(
                'Edit Profil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     spreadRadius: 2,
        //     blurRadius: 5,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10.0),
          _buildInfoItem('Username', username),
          SizedBox(height: 20.0),
          _buildInfoItem('Email', email),
          SizedBox(height: 20.0),
          _buildInfoItem('Password', password),
          SizedBox(height: 20.0),
          _buildInfoItem('Nomor Telepon', phoneNumber),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        SizedBox(height: 8.0), // Add margin bottom
      ],
    );
  }

  Future<void> _showImageSelectionDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Choose Image',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.white, // Set background color to white
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16.0), // Adjust the border radius
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildImageSelectionOption(
                icon: Icons.image,
                label: 'Choose from Gallery',
                onGalleryPressed: () {
                  _selectImageFromGallery();
                  Navigator.pop(context);
                },
                onCancelPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 16.0),
              // Add more options if needed
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageSelectionOption({
    required IconData icon,
    required String label,
    required VoidCallback onGalleryPressed,
    required VoidCallback onCancelPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: onGalleryPressed,
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF0700FF),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Adjust the border radius
            ),
            minimumSize:
                Size(double.infinity, 50.0), // Adjust the button height
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        OutlinedButton(
          onPressed: onCancelPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Adjust the border radius
            ),
            minimumSize:
                Size(double.infinity, 50.0), // Adjust the button height
          ),
          child: Center(
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  // Function to select image from the gallery
  Future<void> _selectImageFromGallery() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File pickedImage = File(pickedFile.path);
        setState(() {
          _selectedImage = pickedImage;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
