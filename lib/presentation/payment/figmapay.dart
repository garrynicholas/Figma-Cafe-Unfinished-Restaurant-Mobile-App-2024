import 'package:figmacafe/beranda.dart';
import 'package:figmacafe/presentation/notification.dart';
import 'package:figmacafe/presentation/order.dart';
import 'package:figmacafe/presentation/payment/tipe_payment.dart';
import 'package:figmacafe/presentation/reservasi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FigmaPayPage extends StatefulWidget {
  @override
  _FigmaPayPageState createState() => _FigmaPayPageState();
}

class _FigmaPayPageState extends State<FigmaPayPage> {
  double totalBalance = 150000.0; // Initial balance
  List<Transaction> transactions = [
    Transaction(amount: 50000.0, date: DateTime.now()),
    Transaction(
        amount: -25000.0, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        amount: 100000.0, date: DateTime.now().subtract(Duration(days: 5))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f5f9),
      body: ListView(
        padding: EdgeInsets.only(
          top: 36.0,
          left: 16.0,
          bottom: 16.0,
          right: 16.0,
        ),
        children: [
          // Title
          Text(
            'FigmaPay',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
          ),
          // Subtitle
          Text(
            'Pembayaran harian fleksibel yang sederhana',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 26.0), // Adjusted spacing
          // Container 1 for Credit Card
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            padding: EdgeInsets.fromLTRB(20, 0, 16, 16),
            height: 228, // Set the height as needed
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0700FF), Colors.blue],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/worldcard1.png'), // Adjust the image path accordingly
                fit: BoxFit.cover, // Cover the entire container
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add the image at the top left
                Image.asset(
                  'assets/images/card1.png', // Adjust the image path accordingly
                  width: 80, // Adjust the width as needed
                  height: 80, // Adjust the height as needed
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '150.000',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '4028 **** **** ****',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Courier New',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 22), // Add some space before the full name

                // Add the full name
                Text(
                  'GUNAWAN WIDYA NUGRAHA', // Replace with the actual full name
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: 0), // Adjust the space as needed
              ],
            ),
          ),
          SizedBox(height: 10.0),
          // Green Container
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 21, 202, 27), // Green color
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.wallet_membership_rounded,
                      color: Colors.white,
                      size: 36.0,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tambahkan Saldo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Text(
                            'Isi saldomu tanpa perlu tambahan potongan transaksi dari kami.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          // Inside _FigmaPayPageState class
          InkWell(
            onTap: () {
              // Navigate to TambahSaldoPage when the button is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TipePayment()),
              ).then((authenticationCode) {
                // Handle the authentication code returned from PaymentPage
                if (authenticationCode != null) {
                  // Update the FigmaPayPage with the new transaction
                  setState(() {
                    totalBalance += 50000.0; // Use the selected amount
                    transactions.insert(
                        0,
                        Transaction(
                          amount: 50000.0, // Use the selected amount
                          date: DateTime.now(),
                        ));
                  });
                }
              });
            },
            borderRadius: BorderRadius.circular(16.0),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0700FF), Color(0xFF00CCFF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x400700FF), // Adjust the opacity as needed
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 15.0), // Adjusted padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.nine_k_plus,
                        size: 26.0, color: Colors.white), // Added color
                    SizedBox(width: 10.0),
                    Text(
                      'Tambah Saldo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        color: Colors.white, // Added color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          // Latest Transactions
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Transaksi sebelumnya',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          // Transaction List
          Column(
            children: transactions.map((transaction) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TransactionCard(transaction: transaction),
              );
            }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFF0700FF),
          unselectedItemColor: const Color.fromARGB(255, 83, 83, 83),
          currentIndex: 1, // Set the index of the "Payment" tab
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
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
}

class Transaction {
  final double amount;
  final DateTime date;

  Transaction({required this.amount, required this.date});
}

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(
          transaction.amount < 0
              ? Icons.arrow_circle_down
              : Icons.arrow_circle_up,
          size: 30.0,
          color: transaction.amount < 0 ? Colors.red : Colors.green,
        ),
        title: Text(
          'Rp. ${NumberFormat('#,##0').format(transaction.amount.abs())}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        subtitle: Text(
          DateFormat('MMM d, yyyy').format(transaction.date),
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
