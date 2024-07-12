import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class RekeningRestoran extends StatelessWidget {
  final String restaurantAccountNumber = "4093 5678 9012";

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
      resizeToAvoidBottomInset: false, // Set this property to false
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      body: Stack(
        children: [
          // // Background Image
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/images/1.png',
          //     fit: BoxFit.cover,
          //     alignment: Alignment.topCenter,
          //   ),
          // ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                      child: Image.asset(
                        'assets/images/succ.png', // Replace with your image path
                        width: 250.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Sukses',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0700FF),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Pesananmu telah berhasil diproses',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              _showDetailPesananBottomSheet(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0700FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                'Detail Pesanan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Enhanced styling for the restaurant account number container
                  Container(
                    padding: EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0700FF), Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Color(0xFF0700FF).withOpacity(0.3),
                      //     spreadRadius: 2,
                      //     blurRadius: 8,
                      //     offset: Offset(0, 4),
                      //   ),
                      // ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Nomor Rekening Restoran',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          restaurantAccountNumber,
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: SlideCountdown(
                      duration: const Duration(minutes: 5),
                      separatorType: SeparatorType.title,
                      slideDirection: SlideDirection.up,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Warning Dropdown
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.white,
                    child: ExpansionTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.payment,
                            color: Colors.black,
                          ), // Add payment icon here
                          SizedBox(width: 8.0),
                          Text(
                            'Pembayaran',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Text(
                            'Silakan segera melakukan pembayaran dalam 5 menit. Jika Anda belum melakukan pembayaran, maka pesanan akan dibatalkan.',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                            // textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.white,
                    child: ExpansionTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: Colors.black,
                          ), // Add info icon here
                          SizedBox(width: 8.0),
                          Text(
                            'Instruksi',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: buildNumberedInstructions([
                            'Transfer jumlah total ke nomor rekening restoran yang diberikan.',
                            'Gunakan layanan pembayaran pilihan Anda.',
                            'Segera lakukan pembayaran order sebelum 5 menit mendatang.',
                          ]),
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

  Widget buildNumberedInstructions(List<String> instructions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        instructions.length,
        (index) => Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${index + 1}. ${instructions[index]}',
                style: TextStyle(fontSize: 14.0, color: Colors.black54),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
