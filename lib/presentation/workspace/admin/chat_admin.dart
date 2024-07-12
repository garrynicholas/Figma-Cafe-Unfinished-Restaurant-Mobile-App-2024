import 'package:flutter/material.dart';

class ChatAdmin extends StatefulWidget {
  const ChatAdmin({Key? key}) : super(key: key);

  @override
  State<ChatAdmin> createState() => _ChatAdminState();
}

class _ChatAdminState extends State<ChatAdmin> {
  List<String> senders = ['John Doe', 'Figma Kasir', 'Manda', 'Xiao', 'Benny'];
  List<String> messages = [
    'Kasir mengalami masalah saat bertransaksi. Tolong bantu.',
    'customer Davin mengalami masalah',
    'Saya tidak dapat menyelesaikan transaksi customer Avin',
    'Periksa customer bernama Lenx22, dia menipu orderan untuk bercanda aja',
    'food product 1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027),
      appBar: AppBar(
        title: Text('Admin Chat', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0700FF), // Set app bar background color
        iconTheme: IconThemeData(
          color: Colors.white, // Set icon color
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Color(0xFF020049), // Set card background color
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  senders.length,
                  (index) =>
                      _buildChatMessage(senders[index], messages[index], index),
                )..add(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatMessage(String sender, String message, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sender
        Text(
          sender,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 4.0),
        // Message
        Text(message, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8.0),
        // Hapus Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle delete action untuk message
                _handleDelete(index);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
              ),
              child: Text('Hapus', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        Divider(color: Colors.white),
      ],
    );
  }

  void _handleDelete(int index) {
    // Handle delete action untuk message pada index specifix
    setState(() {
      senders.removeAt(index);
      messages.removeAt(index);
    });
  }
}
