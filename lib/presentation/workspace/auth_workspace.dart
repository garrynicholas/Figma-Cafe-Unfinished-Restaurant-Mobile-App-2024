import 'package:figmacafe/presentation/workspace/choose_rules.dart';
import 'package:flutter/material.dart';

class AuthWorkSpace extends StatefulWidget {
  const AuthWorkSpace({Key? key}) : super(key: key);

  @override
  _AuthWorkSpaceState createState() => _AuthWorkSpaceState();
}

class _AuthWorkSpaceState extends State<AuthWorkSpace> {
  TextEditingController _authCodeController = TextEditingController();
  String _errorMessage = '';

  // The correct auth code
  // deklarasi sekaligus inisialisasi variabel konstan
  // mengapa static, karena saya bisa akses langsung AuthWorkSpace.correctAuthCode tanpa perlu membuat instansi objek
  static const String correctAuthCode = '303404';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildWarningTab(),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF0700FF),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        size: 24.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          'Untuk akses ke halaman, pekerja diharapkan untuk memasukkan kode autentikasi di bawah ini.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _authCodeController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Kode Autentikasi',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0700FF)),
                    ),
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 42.0),
                ElevatedButton(
                  onPressed: () {
                    _authenticate();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    minimumSize: Size(double.infinity, 45.0),
                  ),
                  child: Text('Akses'),
                ),
                SizedBox(height: 8.0),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWarningTab() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              Icons.warning_rounded,
              size: 48.0,
              color: Colors.black,
            ),
            SizedBox(height: 14.0),
            Text(
              'Halaman ini hanya diperuntukkan khusus untuk digunakan oleh para pekerja Figma Cafe, termasuk Kasir dan Admin. Harap diperhatikan bahwa akses terhadap halaman ini dibatasi hanya untuk mereka yang bekerja di bidang restoran.',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: () {
                // Handle close action
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black),
              ),
              child: Text(
                'Kembali ke Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _authenticate() {
    // Check jika kode autentikasi yang dimasukkan benar
    if (_authCodeController.text == correctAuthCode) {
      // Navigasi ke workspace page jika kode autentikasi sudah benar
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChooseRules()),
      );
    } else {
      // Display error message jika kode autentikasi salah
      setState(() {
        _errorMessage = 'Kode Autentikasi salah. Coba lagi.';
      });
    }
  }
}
