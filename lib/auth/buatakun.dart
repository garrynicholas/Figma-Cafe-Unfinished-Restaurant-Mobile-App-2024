import 'package:figmacafe/auth/buatalamat.dart';
import 'package:figmacafe/auth/masuk.dart';
import 'package:figmacafe/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class BuatAkun extends StatefulWidget {
  const BuatAkun({Key? key}) : super(key: key);

  @override
  _BuatAkunState createState() => _BuatAkunState();
}

class _BuatAkunState extends State<BuatAkun> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
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
                    height: 40,
                  ),
                  Image.asset("assets/images/cafe.png"),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                    "Username",
                    Icons.person_outlined,
                    false,
                    _userNameTextController,
                    false,
                  ),
                  const SizedBox(height: 10),
                  reusableTextField(
                    "Email",
                    Icons.email_outlined,
                    false,
                    _emailTextController,
                    false,
                  ),
                  const SizedBox(height: 10),
                  reusableTextField(
                    "Password",
                    Icons.lock_outline,
                    true,
                    _passwordTextController,
                    false,
                  ),
                  const SizedBox(height: 10),
                  reusableTextField(
                    "Phone Number",
                    Icons.phone_outlined,
                    false,
                    _phoneNumberTextController,
                    false,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  nextButton(context, true, () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuatAlamat()),
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
                'Copyright 2024 © Influx Engine',
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
