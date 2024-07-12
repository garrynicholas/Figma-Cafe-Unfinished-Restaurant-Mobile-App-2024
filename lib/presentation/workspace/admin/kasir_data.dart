import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Kasir {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  Kasir({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });
}

class KasirData extends StatefulWidget {
  const KasirData({Key? key}) : super(key: key);

  @override
  State<KasirData> createState() => _KasirDataState();
}

class _KasirDataState extends State<KasirData> {
  List<Kasir> kasirList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027),
      appBar: AppBar(
        backgroundColor: Color(0xFF010027),
        title: Text(
          'Kasir Data',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Set icon color
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('Nama', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Email', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Password', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Nomor Telepon',
                    style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Action', style: TextStyle(color: Colors.white))),
          ],
          rows: kasirList.map((kasir) {
            return DataRow(
              cells: [
                DataCell(
                    Text(kasir.name, style: TextStyle(color: Colors.white))),
                DataCell(
                    Text(kasir.email, style: TextStyle(color: Colors.white))),
                DataCell(Text(kasir.password,
                    style: TextStyle(color: Colors.white))),
                DataCell(Text(kasir.phoneNumber,
                    style: TextStyle(color: Colors.white))),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      // Handle delete action
                      setState(() {
                        kasirList.remove(kasir);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Hapus'),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Masuk ke page AddKasir dan await result
          var newKasir = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddKasir()),
          );

          // Check jika data Kasir baru tidak bernilai null
          if (newKasir != null) {
            // Update Kasir list dengan data Kasir baru
            setState(() {
              kasirList.add(newKasir);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddKasir extends StatefulWidget {
  const AddKasir({Key? key}) : super(key: key);

  @override
  State<AddKasir> createState() => _AddKasirState();
}

class _AddKasirState extends State<AddKasir> {
  // Controller untuk text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // Input formatters
  final phoneFormatter = FilteringTextInputFormatter.allow(RegExp(r"[0-9]"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text field untuk Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),

            // Text field untuk Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),

            // Text field untuk Password
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),

            // Text field untuk Phone Number
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.number,
              inputFormatters: [phoneFormatter],
            ),
            SizedBox(height: 16.0),

            // Button untuk tambah Kasir
            ElevatedButton(
              onPressed: () {
                // Handle tambah Kasir action
                String name = nameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                String phoneNumber = phoneNumberController.text;

                if (name.isNotEmpty &&
                    email.isNotEmpty &&
                    password.isNotEmpty &&
                    phoneNumber.isNotEmpty) {
                  Kasir newKasir = Kasir(
                    name: name,
                    email: email,
                    password: password,
                    phoneNumber: phoneNumber,
                  );

                  // Return data Kasir yang baru ke halaman sebelumnya
                  Navigator.pop(context, newKasir);
                }
              },
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
