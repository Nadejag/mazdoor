import 'package:flutter/material.dart';
import 'package:mazdoor/Screens/Navigationscreen.dart';
import 'package:mazdoor/Screens/home.dart';
import 'dart:async';

import 'choosecatscreen.dart';
import 'otpscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavigationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://static.vecteezy.com/system/resources/previews/044/612/509/non_2x/labour-silhouette-isolated-on-white-background-may-day-concept-free-vector.jpg', height: 200),
            // SizedBox(height: 2),
            Text(
              "Mazdoor",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            SizedBox(height: 10),
            Text(
              "Easy Work, Easy Life",
              style: TextStyle(fontSize: 18, color: Colors.deepOrange),
            ),
          ],
        ),
      ),
    );
  }
}
