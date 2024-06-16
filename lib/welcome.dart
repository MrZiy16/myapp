import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Timer untuk menunggu selama 5 detik
    Timer(Duration(seconds: 8), () {
      // Mengarahkan ke HomePage setelah 5 detik
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Menggunakan ClipOval untuk membuat gambar logo bulat
            ClipOval(
              child: Image.asset(
                'assets/logo.jpg',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 100),
            Text(
              'Kulinerin',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
