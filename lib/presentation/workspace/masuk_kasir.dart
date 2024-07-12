import 'package:figmacafe/presentation/workspace/kasir/kasir_dashboard.dart';
import 'package:figmacafe/user/user_provider.dart';
import 'package:figmacafe/widgets/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MasukKasir extends StatefulWidget {
  const MasukKasir({super.key});

  @override
  State<MasukKasir> createState() => _MasukKasirState();
}

class _MasukKasirState extends State<MasukKasir> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  bool _emailError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFF010027),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Image.asset("assets/images/cafe_work.png"),
                SizedBox(
                  height: 10,
                ),
                reusableTextField(
                  "Email",
                  Icons.email_outlined,
                  false,
                  _emailTextController,
                  false,
                ),
                SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                  false,
                ),
                SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Kode Restoran",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                  false,
                ),
                SizedBox(
                  height: 30,
                ),
                masukRuleButton(
                  context,
                  true,
                  () async {
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
                        MaterialPageRoute(
                            builder: (context) => KasirDashboard()),
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
                  },
                ),
                SizedBox(
                  height: 100.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KasirDashboard(),
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
                        'Force Kasir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Copyright 2024 © Influx Engine',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
