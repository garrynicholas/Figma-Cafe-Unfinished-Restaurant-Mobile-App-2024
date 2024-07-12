import 'package:flutter/material.dart';

class Intros extends StatefulWidget {
  const Intros({Key? key}) : super(key: key);

  @override
  State<Intros> createState() => _IntrosState();
}

class _IntrosState extends State<Intros> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Map<String, String>> introData = [
    {
      'title': 'Halo, selamat datang!',
      'description':
          'Di sini, makanan enak dan vibe keren nungguin kamu. Yuk, mampir dan dapetin pengalaman kuliner enak di Figma Cafe',
      'image': 'assets/images/introm1.png',
    },
    {
      'title': 'Menu Spesial',
      'description':
          'Cobain menu khas kita yang terbaru, mulai dari hidangan pembuka, makanan utama, sampe pencuci mulut juga loh',
      'image': 'assets/images/introm1.png',
    },
    {
      'title': 'Promo Gokil Setiap Hari!',
      'description':
          'Ada promo asik tiap hari di Figma Cafe, guys! Diskon makanan, paket hemat, semuanya ada. jangan ampe ketinggalan',
      'image': 'assets/images/introm1.png',
    },
    {
      'title': 'Ayo mulai Login dan dapetin promo menarik!',
      'description': '',
      'image': 'assets/images/introm1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: introData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return buildIntroPage(introData[index]);
              },
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildIntroPage(Map<String, String> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          data['image']!,
          height: 300, // Sesuaikan tinggi sesuai kebutuhan
        ),
        SizedBox(height: 16),
        Text(
          data['title']!,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Color(0xFF010027),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            data['description']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF010027),
            ),
          ),
        ),
        SizedBox(height: 16), // Tambahkan jarak tambahan
        Padding(
          padding: const EdgeInsets.fromLTRB(96, 32, 96, 0),
          child: ElevatedButton(
            onPressed: () {
              // Handle button press, navigate to another screen, etc.
              if (_currentPage == introData.length - 1) {
                // Perform action for "Masuk" and "Buat Akun" button
                // For now, let's just print a message
                print('Perform action for "Masuk" and "Buat Akun"');
              } else {
                // Go to the next page
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF0700FF), // Warna latar belakang tombol
              onPrimary: Colors.white, // Warna teks
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
            child: Text(
              _currentPage == introData.length - 1
                  ? 'Masuk / Buat Akun'
                  : 'Selanjutnya',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
