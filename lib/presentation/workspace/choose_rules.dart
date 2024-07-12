import 'package:figmacafe/presentation/workspace/masuk_kasir.dart';
import 'package:figmacafe/presentation/workspace/masuk_admin.dart';
import 'package:flutter/material.dart';

class ChooseRules extends StatefulWidget {
  const ChooseRules({super.key});

  @override
  State<ChooseRules> createState() => _ChooseRulesState();
}

class _ChooseRulesState extends State<ChooseRules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010027),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image on top
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cafe_work.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 160),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Masuk button click
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MasukKasir()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Color(0xFF0700FF), // Text color
                      padding: EdgeInsets.zero,
                    ),
                    child: SizedBox(
                      width: double.infinity, // Full-width button
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'MASUK SEBAGAI KASIR',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Masuk button click
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MasukManager()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Color(0xFF0700FF), // Masuk button background color
                      onPrimary: Colors.white, // Text color
                      padding: EdgeInsets.zero,
                    ),
                    child: SizedBox(
                      width: double.infinity, // Full-width button
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'MASUK SEBAGAI ADMIN',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
