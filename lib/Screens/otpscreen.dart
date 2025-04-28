import 'package:flutter/material.dart';

import 'home.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();
  bool canResend = false;

  @override
  void initState() {
    super.initState();
    // Allow resend after 30 seconds
    Future.delayed(Duration(seconds: 30), () {
      setState(() {
        canResend = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 30),
            Text(
              "Verify OTP",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: "Enter OTP",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle OTP verification
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Verify"),
            ),
            SizedBox(height: 15),
            if (canResend)
              GestureDetector(
                onTap: () {
                  // Handle resend OTP action
                },
                child: Text(
                  "Resend OTP",
                  style: TextStyle(color: Colors.green[800]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
