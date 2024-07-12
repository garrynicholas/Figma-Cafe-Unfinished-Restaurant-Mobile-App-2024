import 'package:figmacafe/auth/buatakun.dart';
import 'package:figmacafe/beranda.dart';
import 'package:figmacafe/presentation/workspace/auth_workspace.dart';
import 'package:figmacafe/user/user_provider.dart';
import 'package:figmacafe/widgets/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Masuk extends StatefulWidget {
  const Masuk({Key? key}) : super(key: key);

  @override
  _MasukState createState() => _MasukState();
}
 
class _MasukState extends State<Masuk> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
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
                  SizedBox(
                    height: 40,
                  ),
                  reusableTextField(
                    "Email",
                    Icons.email_outlined,
                    false,
                    _emailTextController,
                    false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  reusableTextField(
                    "Password",
                    Icons.lock_outline,
                    true,
                    _passwordTextController,
                    false,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  masukButton(context, true, () async {
                    setState(() {
                      _emailError = false;
                    });

                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );

                      // Store user information using Provider
                      Provider.of<UserProvider>(context, listen: false)
                          .setUser(userCredential.user);

                      // Navigate to Beranda page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()),
                      );
                    } catch (error) {
                      print("Error ${error.toString()}");
                      if (error is FirebaseAuthException &&
                          error.code == 'user-not-found') {
                        setState(() {
                          _emailError = true;
                        });

                        // Show a specific error message for user-not-found using ScaffoldMessenger
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'User not found. Please check your email.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        // Show a generic error message using ScaffoldMessenger
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login kamu salah. Coba lagi.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    }
                  }),
                  buatAkunOption(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthWorkSpace(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Workspace',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Beranda(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0700FF),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Force Log',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
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

  Row buatAkunOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Tidak Punya Akun? ",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuatAkun()),
            );
          },
          child: const Text(
            "Buat Akun",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
