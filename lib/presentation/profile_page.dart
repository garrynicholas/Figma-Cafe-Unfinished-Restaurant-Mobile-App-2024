import 'package:figmacafe/auth/masuk.dart';
import 'package:figmacafe/presentation/notification.dart';
import 'package:figmacafe/presentation/order.dart';
import 'package:figmacafe/presentation/payment/figmapay.dart';
import 'package:figmacafe/presentation/profile_master/alamat.dart';
import 'package:figmacafe/presentation/profile_master/favorit.dart';
import 'package:figmacafe/presentation/profile_master/informasi_profile.dart';
import 'package:figmacafe/presentation/profile_master/test_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        title: Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/images/better.png',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Paraxites Engine',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      'widyagunawan3@gmail.com',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      '+6289699642764',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.0), // Adjusted spacing
            Text(
              'Akun',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildToolButton(
                  context,
                  'Edit informasi akun',
                  Icons.manage_accounts_outlined,
                  Colors.white,
                  Colors.black,
                  () => navigateToAccount(context),
                ),
                SizedBox(
                  height: 6,
                ),
                _buildToolButton(
                    context,
                    'Payment',
                    Icons.payment,
                    Colors.white,
                    Colors.black,
                    () => navigateToPayment(context)),
                SizedBox(
                  height: 6,
                ),
                _buildToolButton(context, 'Order', Icons.shopping_cart,
                    Colors.white, Colors.black, () => navigateToOrder(context)),
                SizedBox(
                  height: 6,
                ),
                // _buildToolButton(
                //     context,
                //     'Favorit',
                //     Icons.favorite_rounded,
                //     Colors.white,
                //     Colors.black,
                //     () => navigateToFavourite(context)),
                // SizedBox(
                //   height: 6,
                // ),
                _buildToolButton(
                    context,
                    'Notifikasi',
                    Icons.notifications,
                    Colors.white,
                    Colors.black,
                    () => navigateToNotifications(context)),
                SizedBox(
                  height: 6,
                ),
                _buildToolButton(
                    context,
                    'Alamat',
                    Icons.add_home_work_outlined,
                    Colors.white,
                    Colors.black,
                    () => navigateToAlamat(context)),
                SizedBox(
                  height: 6,
                ),
                _buildToolButton(
                    context,
                    'Log Out',
                    Icons.accessibility_new_rounded,
                    Colors.white,
                    Colors.black,
                    () => navigateToLogOut(context)),
              ],
            ),
            Spacer(), // Pushes the following text to the bottom
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Copyright 2024 © Influx Engine',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolButton(BuildContext context, String label, IconData icon,
      Color backgroundColor, Color textColor, VoidCallback onPressed) {
    return Material(
      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
      color: backgroundColor,

      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8.0), // Same radius as Material
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: textColor),
                  SizedBox(width: 8.0),
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: textColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward, color: textColor),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InformasiProfile()),
    );
  }

  void navigateToPayment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FigmaPayPage()),
    );
  }

  void navigateToOrder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderPage()),
    );
  }

  void navigateToFavourite(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Favorit()),
    );
  }

  void navigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationPage()),
    );
  }

  void navigateToAlamat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Alamat()),
    );
  }

  void navigateToLogOut(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Masuk()),
    );
  }
}
