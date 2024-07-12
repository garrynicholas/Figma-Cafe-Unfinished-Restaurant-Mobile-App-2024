import 'package:flutter/material.dart';

class Favorit extends StatefulWidget {
  const Favorit({Key? key}) : super(key: key);

  @override
  State<Favorit> createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  List<String> makananWishlist = [
    'Nasi Goreng',
    'Ayam Bakar',
    'Sate',
    'Rendang',
  ];

  List<String> minumanWishlist = [
    'Es Teh Manis',
    'Jus Jeruk',
    'Kopi',
    'Es Campur',
  ];

  // Map to track the checklist visibility for each item
  Map<String, bool> checklistVisibility = {};

  @override
  void initState() {
    super.initState();
    // Initialize checklistVisibility with false for each item
    for (String item in [...makananWishlist, ...minumanWishlist]) {
      checklistVisibility[item] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Combine the makananWishlist and minumanWishlist
    List<String> combinedWishlist = [...makananWishlist, ...minumanWishlist];

    return Scaffold(
      backgroundColor: Color(0xFFf3f5f9),
      appBar: AppBar(
        title: Text(
          'Wishlist',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWishlist(combinedWishlist),
          ],
        ),
      ),
    );
  }

  Widget _buildWishlist(List<String> wishlist) {
    return Expanded(
      child: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final item = wishlist[index];
          return _buildWishlistItem(item);
        },
      ),
    );
  }

  Widget _buildWishlistItem(String item) {
    return Container(
      height: 95.0,
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Row(
          children: [
            // Left side with rounded square image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/better.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Right side with text and checklist icon
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 247, 247),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Makanan',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                        // Checklist Icon
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              checklistVisibility[item] =
                                  !(checklistVisibility[item] ?? false);
                            });
                          },
                          child: Container(
                            width: 22.0,
                            height: 22.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: checklistVisibility[item] == true
                                    ? Colors.transparent
                                    : Colors.black,
                              ),
                            ),
                            child: checklistVisibility[item] == true
                                ? CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 15.0,
                                  )
                                : Container(),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      item,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '10K',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 41, 199, 46),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
