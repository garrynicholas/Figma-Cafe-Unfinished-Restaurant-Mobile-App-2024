import 'package:figmacafe/auth/buatakun.dart';
import 'package:figmacafe/auth/masuk.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<SliderContent> slides = [
    SliderContent(
      image: 'assets/images/intro1.jpeg',
      title: 'Halo, selamat datang!',
      description:
          'Di sini, makanan enak dan vibe keren nungguin kamu. Yuk, mampir dan dapetin pengalaman kuliner enak di Figma Cafe',
    ),
    SliderContent(
      image: 'assets/images/intro2.jpeg',
      title: 'Menu Spesial',
      description:
          'Cobain menu khas kita yang terbaru, mulai dari hidangan pembuka, makanan utama, sampe pencuci mulut juga loh',
    ),
    SliderContent(
      image: 'assets/images/intro3.jpeg',
      title: 'Promo Gokil Setiap Hari!',
      description:
          'Ada promo asik tiap hari di Figma Cafe, guys! Diskon makanan, paket hemat, semuanya ada. jangan ampe ketinggalan',
    ),
    SliderContent(
      image: 'assets/images/intro4.jpeg',
      title: 'Ayo mulai Login dan dapetin promo menarik!',
      description: '',
      isActionSlide: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return slides[index];
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < slides.length; i++) {
      indicators.add(_indicator(i == _currentPage));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class SliderContent extends StatelessWidget {
  final String image;
  final String? title;
  final String? description;
  final bool isActionSlide;

  SliderContent({
    required this.image,
    this.title,
    this.description,
    this.isActionSlide = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your existing SliderContent code here

      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 309,
                    padding: EdgeInsets.all(36.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != null)
                              Text(
                                title!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            if (description != null) SizedBox(height: 10.0),
                            if (description != null)
                              Text(
                                description!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            if (isActionSlide) SizedBox(height: 20.0),
                            if (isActionSlide)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle Masuk button click
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Masuk()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Color(0xFF0700FF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        'MASUK',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle Buat Akun button click
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BuatAkun()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF0700FF),
                                      onPrimary: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        'BUAT AKUN',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        // Add Next text in the bottom right inside the white container
                        if (!isActionSlide)
                          Positioned(
                            bottom: 10.0,
                            right: 10.0,
                            child: Text(
                              'Geser',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
