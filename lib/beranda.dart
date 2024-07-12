import 'package:carousel_slider/carousel_slider.dart';
import 'package:figmacafe/presentation/food_widgets/product_card.dart';
import 'package:figmacafe/presentation/reservasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/profile_page.dart';
import 'presentation/payment/figmapay.dart';
import 'presentation/order.dart';
import 'presentation/notification.dart'; // Import the notification page
import 'user/user_provider.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  // inisialisasi awal kategori
  String selectedCategory = "Food";
  Map<String, int> productStock = {
    // "Sea Salt Cookies & Cream": 10,
    // "French Fries": 20,
    // Add other products with their initial stock values
  };

  // Fungsi _changeCategory digunakan untuk mengganti nilai variabel selectedCategory
  // dengan nilai baru yang diterima sebagai argumen (parameter) fungsi.

  /* String category adalah parameter: Fungsi ini menerima satu parameter yang disebut category, 
  yang merupakan nilai baru yang ingin ditetapkan ke selectedCategory */
  void _changeCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.0),
        child: AppBar(
          automaticallyImplyLeading: false, // remove back arrow
          backgroundColor:
              Colors.transparent, // Make the AppBar background transparent
          flexibleSpace: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Offset in the bottom direction
                ),
              ],
            ),
            child: Container(
              color: Colors.white, // Background color for the AppBar
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        // Menavigasi ke halaman lain ketika search diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBar()),
                        );
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Cari makanan/minuman favoritmu',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                contentPadding: EdgeInsets.only(
                                  left: 24.0,
                                  top: 10.0,
                                  bottom: 0.0,
                                ), // Adjusted padding
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 30.0, 10.0, 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 1.0),
                        ),
                        child: CircleAvatar(
                          radius: 22.0,
                          backgroundColor: Colors.grey[300],
                          child: CircleAvatar(
                            radius: 28.0,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(),
                                  ),
                                );
                              },
                              iconSize: 22.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 247, 247, 247),
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Image.asset(
                    "assets/images/foodsup.png",
                    width: double.infinity,
                    /* Ketika fit diatur sebagai BoxFit.cover, artinya gambar akan diperbesar atau diperkecil sesuai proporsi 
                    sehingga seluruh kontainer tercakup dan gambar sepenuhnya ditutupi tanpa merubah proporsi asli gambar. */
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/foodsup1.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/foodsup2.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true, // Mengaktifkan mode putar otomatis
                  enlargeCenterPage:
                      true, // Memperbesar elemen yang berada di tengah halaman (center page) untuk memberikan fokus visual pada elemen
                  viewportFraction:
                      1.0, // Menunjukkan bahwa elemen di dalam carousel harus mengambil seluruh lebar viewport
                  aspectRatio: 2.0,
                  initialPage:
                      0, // Menentukan halaman awal yang akan ditampilkan saat carousel pertama kali muncul
                ),
              ),
              _buildPromotionalContent(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 12.0,
                  bottom: 8.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kategori",
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Cari makanan/minuman favoritmu pake rekomendasi bawah ini",
                      style: TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        //ketika ditekan (onPressed), fungsi _changeCategory akan dipanggil dengan argumen "Food".
                        onPressed: () => _changeCategory("Food"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            // ? = true, : = false
                            side: BorderSide(
                              color: selectedCategory == "Food"
                                  ? Colors.transparent
                                  : Color(0xFF0700FF),
                            ),
                          ),
                          minimumSize: Size(double.infinity, 60.0),
                          primary: selectedCategory == "Food"
                              ? Color(0xFF0700FF)
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fastfood,
                                color: selectedCategory == "Food"
                                    ? Colors.white
                                    : Color(0xFF0700FF)), // Food icon
                            SizedBox(width: 8.0),
                            Text(
                              'Makanan',
                              style: TextStyle(
                                color: selectedCategory == "Food"
                                    ? Colors.white
                                    : Color(0xFF0700FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _changeCategory("Beverages"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: selectedCategory == "Beverages"
                                  ? Colors.transparent
                                  : Color(0xFF0700FF),
                            ),
                          ),
                          minimumSize: Size(double.infinity, 60.0),
                          primary: selectedCategory == "Beverages"
                              ? Color(0xFF0700FF)
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.local_drink,
                                color: selectedCategory == "Beverages"
                                    ? Colors.white
                                    : Color(0xFF0700FF)), // Beverage icon
                            SizedBox(width: 8.0),
                            Text(
                              'Minuman',
                              style: TextStyle(
                                color: selectedCategory == "Beverages"
                                    ? Colors.white
                                    : Color(0xFF0700FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // "Food" / "Beverages" adalah string literal, yang digunakan untuk membandingkan nilai dari variabel
              if (selectedCategory == "Food") _buildFoodContent(),
              if (selectedCategory == "Beverages") _buildBeveragesContent(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFF0700FF),
          unselectedItemColor: const Color.fromARGB(255, 83, 83, 83),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: 'Payment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Reservasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'Notifikasi',
            ),
          ],
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FigmaPayPage()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderPage()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reservasi()),
              );
            } else if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildFoodContent() {
    return Column(
      children: [
        // First row dengan dua item
        /* Expanded memberikan instruksi kepada Flutter untuk memastikan bahwa 
        setiap ProductCard memiliki bagian lebar yang sama dalam Row */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ProductCard(
                  // instance adalah pembuatan objek dari class, method, widget
                  //dibawah ini adalah instance untuk mempresentasikan data yg ditampilkan di UI
                  // menggunakan instance dari widget ProductCard
                  title: "Homixide Bread",
                  description:
                      "Bread is a staple food prepared from a dough of flour and water, usually by baking. Throughout recorded history and around the world, it has been an important part of many cultures' diet.",
                  imageAssets: "assets/images/bread.png",
                  price: 15,
                  updateAvailability: updateAvailability,
                  isAvailable: true,
                  typeFood: "Desserts",
                  calories: "320 Kcal",
                  waitTime: "7 Menit",
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ProductCard(
                  title: "French Fries",
                  description:
                      "French fries are thin strips of deep-fried potato topped with a choice of condiments. Perfect as a snack or a side dish, French fries have long been a staple of fast-food.",
                  imageAssets: "assets/images/french_fries.jpg",
                  price: 25,
                  updateAvailability: updateAvailability,
                  isAvailable: true,
                  typeFood: "Snacks",
                  calories: "450 Kcal",
                  waitTime: "10 Menit",
                ),
              ),
            ),
          ],
        ),
        // Second row dengan dua item
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ProductCard(
                  title: "Fried Rice",
                  description:
                      "Fried rice is a dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed with other ingredients such as eggs, vegetables, seafood, or meat.",
                  imageAssets: "assets/images/fried_rice.jpg",
                  price: 35,
                  updateAvailability: updateAvailability,
                  isAvailable: true,
                  typeFood: "Main Course",
                  calories: "550 Kcal",
                  waitTime: "15 Menit",
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ProductCard(
                  title: "Croissant",
                  description:
                      "A croissant is a buttery, flaky, viennoiserie pastry inspired by the shape of the Austrian kipferl but using the French yeast-leavened laminated dough. Croissants are named for their historical crescent shape.",
                  imageAssets: "assets/images/croissant.png",
                  price: 45,
                  updateAvailability: updateAvailability,
                  isAvailable: true,
                  typeFood: "Breakfast",
                  calories: "380 Kcal",
                  waitTime: "8 Menit",
                ),
              ),
            ),
          ],
        ),
        // tambah row jika perlu
      ],
    );
  }

  Widget _buildBeveragesContent() {
    return Column(
      children: [
        // First row dengan dua item
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ProductCard(
                  title: "Milk Tea",
                  description:
                      "Milk tea refers to several forms of beverage found in many cultures, consisting of some combination of tea and milk. The term milk tea is used for both hot and cold drinks.",
                  imageAssets: "assets/images/milktea.png",
                  price: 15,
                  updateAvailability: updateAvailability,
                  isAvailable: true,
                  typeFood: "Drinks",
                  calories: "120 Kcal",
                  waitTime: "5 Menit",
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ProductCard(
                  title: "Cookies & Cream",
                  description:
                      "Cookies and cream is a variety of ice cream, milkshake and other desserts that includes chocolate sandwich cookies, with the most popular version containing hand or pre-crumbled cookies from Nabisco's Oreo brand under a licensing agreement.",
                  imageAssets: "assets/images/cookiescream.png",
                  price: 20,
                  updateAvailability: updateAvailability,
                  isAvailable: true,
                  typeFood: "Drinks",
                  calories: "200 Kcal",
                  waitTime: "8 Menit",
                ),
              ),
            ),
          ],
        ),
        // Second row dengan dua item
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ProductCard(
                  title: "Matcha-X",
                  description:
                      "Matcha is finely ground powder of specially grown and processed green tea leaves originating in China traditionally consumed in East Asia. It is mostly produced in Japan today.",
                  imageAssets: "assets/images/matchadrink.jpg",
                  price: 15,
                  updateAvailability: updateAvailability,
                  isAvailable: true,
                  typeFood: "Drinks",
                  calories: "50 Kcal",
                  waitTime: "3 Menit",
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ProductCard(
                  title: "Coca Cola",
                  description:
                      "Cola is a carbonated soft drink flavored with vanilla, cinnamon, citrus oils, and other flavorings. Cola became popular worldwide after the American pharmacist John Stith Pemberton invented Coca-Cola. ",
                  imageAssets: "assets/images/cocacola.jpg",
                  price: 7,
                  updateAvailability: updateAvailability,
                  isAvailable: true,
                  typeFood: "Drinks",
                  calories: "150 Kcal",
                  waitTime: "7 Menit",
                ),
              ),
            ),
          ],
        ),
        // Tambah row jika perlu
      ],
    );
  }

  Widget _buildPromotionalContent() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 213.0, // Set fixed height
        child: Container(
          margin: EdgeInsets.only(bottom: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 2,
            //     blurRadius: 5,
            //     offset: Offset(0, 3),
            //   ),
            // ],
          ),
          child: Stack(
            children: [
              // Image untuk promotional content
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  "assets/images/box-content2.png",
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Content didalam image
              Positioned(
                left: 20.0,
                bottom: 16.0,
                top: 16.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title untuk promotional content
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Special Promo",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),

                    // Deskripsi untuk promotional content
                    Container(
                      width: 200.0, // Limit width untuk control text wrapping
                      child: Text(
                        "Discount up to 70%",
                        maxLines: 2, // Limit batas line pada text
                        overflow: TextOverflow
                            .ellipsis, // Show ellipsis (...) jika overflowed
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Action button untuk promotional content
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Text(
                          "Order Sekarang",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }

  void _updateStock(String title, int newStock) {
    setState(() {
      productStock[title] = newStock;
    });
  }
}

// definisi metode untuk memperbarui status stok
void updateAvailability(String productName, bool isEnabled) {
  print('$productName is ${isEnabled ? 'enabled' : 'disabled'} in Beranda.');
}
