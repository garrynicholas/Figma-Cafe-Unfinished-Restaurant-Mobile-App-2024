import 'package:flutter/material.dart';

class CustomerData extends StatefulWidget {
  const CustomerData({Key? key}) : super(key: key);

  @override
  State<CustomerData> createState() => _CustomerDataState();
}

class _CustomerDataState extends State<CustomerData> {
  List<CustomerInfo> customerInfoList = [
    CustomerInfo('User1', 'user1@gmail.com', '1234567890'),
    CustomerInfo('User2', 'user2@gmail.com', '9876543210'),
    CustomerInfo('User3', 'user3@gmail.com', '4567890123'),
    CustomerInfo('User4', 'user4@gmail.com', '7890123456'),
    CustomerInfo('User5', 'user5@gmail.com', '2345678901'),
    CustomerInfo('User6', 'user6@gmail.com', '8901234567'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Data', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0700FF),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('Username', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Email', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Nomor Telepon',
                    style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Action', style: TextStyle(color: Colors.white))),
          ],
          rows: customerInfoList.map((customerInfo) {
            return DataRow(
              cells: [
                DataCell(Text(customerInfo.username,
                    style: TextStyle(color: Colors.white))),
                DataCell(Text(customerInfo.email,
                    style: TextStyle(color: Colors.white))),
                DataCell(Text(customerInfo.phoneNumber,
                    style: TextStyle(color: Colors.white))),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      // Handle block customer action
                      _handleBlockCustomer(customerInfo);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Block', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      backgroundColor: Color(0xFF010027), // Set scaffold background color
    );
  }

  void _handleBlockCustomer(CustomerInfo customerInfo) {
    // Handle block customer
    setState(() {
      customerInfoList.remove(customerInfo);
    });
  }
}

class CustomerInfo {
  final String username;
  final String email;
  final String phoneNumber;

  CustomerInfo(this.username, this.email, this.phoneNumber);
}
