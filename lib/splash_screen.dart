import 'package:figmacafe/intro.dart';
import 'package:figmacafe/intro2.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Mensimulasikan penundaan 4 detik sebelum bertransisi ke main content IntroPage
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.pushReplacement adalah metode yang digunakan untuk memindahkan aplikasi ke layar
      // atau halaman baru dan secara bersamaan menggantikan halaman sebelumnya dalam tumpukan navigasi.
      // Ini berarti bahwa setelah penggantian, pengguna tidak dapat kembali ke halaman sebelumnya menggunakan
      // tombol kembali karena halaman sebelumnya telah dihapus dari tumpukan navigasi.
      Navigator.pushReplacement(
        // context: objek yang memberikan akses ke konteks Flutter
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027), // Set scaffold background color
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFF0700FF)), // Set CircularProgressIndicator color
        ),
      ),
    );
  }
}
