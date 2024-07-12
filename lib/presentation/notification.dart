import 'package:figmacafe/beranda.dart';
import 'package:figmacafe/presentation/order.dart';
import 'package:figmacafe/presentation/payment/figmapay.dart';
import 'package:figmacafe/presentation/reservasi.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 4; // Set the index for the Notifications page

  void _showDetailPesananBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            color: Color.fromARGB(255, 246, 246, 246),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              Container(
                width: 40.0,
                height: 4.0,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 12),
              Text(
                'Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 12),
              _buildInfoCardFullWidth('Nama Customer', 'Yvng Bliccy'),
              SizedBox(height: 4.0),
              _buildInfoCardFullWidth(
                'Food List',
                '1. Nasi Goreng (2)\n2. Ayam Goreng (1)\n3. Es Teh (3)',
              ),
              SizedBox(height: 4.0),
              _buildInfoCardFullWidth('Cabang Restoran', 'XYZ Restaurant'),
              SizedBox(height: 4.0),
              _buildInfoCardFullWidth(
                'Lokasi Customer',
                'Jl. ABC No. 123, City',
              ),
              SizedBox(height: 4.0),
              _buildTwoColumnRow(
                title1: 'Reservasi',
                content1: 'Yes',
                title2: 'Nomor Reservasi',
                content2: 'ABC123',
              ),
              SizedBox(height: 4.0),
              _buildTwoColumnRow(
                title1: 'Tanggal Pesanan',
                content1: '2023-12-31',
                title2: 'Waktu',
                content2: '19:30',
              ),
              SizedBox(height: 12.0), // Add space for the button
              _buildCloseButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
      width: double.infinity,
      height: 48.0,
      child: Material(
        color: Color(0xFF0700FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Metode Pembayaran: SeaBank', // Add your payment type information here
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTwoColumnRow({
    required String title1,
    required String content1,
    required String title2,
    required String content2,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Row(
        children: [
          _buildInfoCardColumn(title1, content1),
          SizedBox(width: 8.0),
          _buildInfoCardColumn(title2, content2),
        ],
      ),
    );
  }

  Widget _buildInfoCardFullWidth(String title, String content) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
      //use material to make no shadow
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCardColumn(String title, String content) {
    return Expanded(
      flex: 1,
      child: Container(
        //use material to make no shadow
        child: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCardColumn2(String title, String content) {
    return Expanded(
      flex: 1,
      child: Container(
        //use material to make no shadow
        child: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Color(0xFFf3f5f9),
        iconTheme: IconThemeData(
          color: Colors.black, // Set icon color
        ),
      ),
      backgroundColor: Color(0xFFf3f5f9), // Set the background color here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationCard(
              'Pesanan diterima',
              'Your order #123 has been accepted and is being prepared.',
              Icons.check_circle,
              Colors.green,
              DateTime.now(),
            ),
            _buildNotificationCard(
              'Pesanan siap',
              'Your order #123 is ready for pickup. Please proceed to the counter.',
              Icons.fastfood,
              Colors.orange,
              DateTime.now(),
            ),
            // Add more notification cards as needed
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFF0700FF),
          unselectedItemColor: const Color.fromARGB(255, 83, 83, 83),
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
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
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            } else if (index == 1) {
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
              // Navigate to the "Notifikasi" page
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

  Widget _buildNotificationCard(
    String title,
    String message,
    IconData iconData,
    Color iconColor,
    DateTime dateTime,
  ) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      iconData,
                      color: iconColor,
                      size: 24.0,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                message,
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 12.0),
                  // Hapus Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle delete action
                      print('Notification deleted: $title');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Hapus',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  // Detail Button
                  ElevatedButton(
                    onPressed: () {
                      // Show details dialog
                      _showDetailPesananBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0700FF),
                      onPrimary: Colors.white,
                      shadowColor: Color(0xFF0700FF),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Detail',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDetailsDialog(String title, DateTime dateTime) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: contentBox(title, dateTime),
        );
      },
    );
  }

  Widget contentBox(String title, DateTime dateTime) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Detail',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0700FF),
                  ),
                ),
                SizedBox(height: 20.0),
                _buildDetailRow('Nama Customer', 'Playboi Farty'),
                _buildDetailRow('Food List', 'Burger, French Fries, Coke'),
                _buildDetailRow('Cabang', 'Figma Cafe Pasuruan'),
                _buildDetailRow(
                    'Lokasi', 'Jl. Nanas Raya, Perumnas Bugul Permai'),
                _buildDetailRow('Reservasi', 'Ya'),
                _buildDetailRow('Nomor Reservasi', 'A13'),
                _buildDetailRow(
                  'Tanggal',
                  '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                ),
                _buildDetailRow(
                  'Waktu',
                  '${dateTime.hour}:${dateTime.minute} WIB',
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0700FF),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                      child: Text('Close'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
