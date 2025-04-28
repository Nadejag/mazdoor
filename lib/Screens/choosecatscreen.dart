import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choosecatscreen extends StatelessWidget {
  const Choosecatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Mazdoor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Color(0xFFFF9500)),)
        ],
      ),
    );
  }
}
