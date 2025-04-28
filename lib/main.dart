// Flutter UI Code for Simple Mazdoor App (Labor-Friendly)

import 'package:flutter/material.dart';

import 'Screens/splashscreen.dart';

void main() => runApp(MazdoorEasyApp());

class MazdoorEasyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mazdoor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: SplashScreen(),
    );
  }
}





// You can create more screens (e.g., JobListScreen, ChatScreen, ProfileScreen)
// following this clean and simple UI style, using large icons, Urdu labels,
// and a friendly layout.
