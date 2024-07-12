import 'package:figmacafe/auth/masuk.dart';
import 'package:figmacafe/beranda.dart';
import 'package:figmacafe/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class BuatAlamat extends StatefulWidget {
  const BuatAlamat({Key? key}) : super(key: key);

  @override
  _BuatAlamatState createState() => _BuatAlamatState();
}

class _BuatAlamatState extends State<BuatAlamat> {
  TextEditingController _alamatTextController = TextEditingController();
  bool _emailError = false; // mentracking jika ada kesalahan input email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // context: objek yang memberikan akses ke konteks Flutter
        // context is a BuildContext instance that gets passed to the
        // builder of a widget in order to let it know where it is inside the Widget Tree of your app.
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFF010027),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * 0,
                20,
                0,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset("assets/images/cafe.png"),
                  // Title and Description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Langkah terakhir',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Anda perlu menambahkan alamat untuk konfirmasi akun Anda.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextAreaField(
                    "Alamat",
                    Icons.email_outlined,
                    false,
                    _alamatTextController,
                    false,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  masukButton(context, false, () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Beranda()),
                    );
                  }),
                  sudahbuatAkunOption(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Copyright 2023 © Influx Engine',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row sudahbuatAkunOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sudah Punya Akun? ",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Masuk()),
            );
          },
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
