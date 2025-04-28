import 'package:flutter/material.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final String laborerName;
  final String service;
  final String date;
  final String time;
  final String location;
  final double price;

  BookingConfirmationScreen({
    required this.laborerName,
    required this.service,
    required this.date,
    required this.time,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Laborer: $laborerName'),
            Text('Service: $service'),
            Text('Date: $date'),
            Text('Time: $time'),
            Text('Location: $location'),
            SizedBox(height: 20),
            Text('Estimated Price: \$${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: Colors.green)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Finalize booking logic here
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Booking Confirmed'),
                      content: Text('Your booking has been confirmed.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Navigate to Home or Search screen
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: Text('Go to Home'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Confirm Booking'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate back to modify the booking or cancel
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Cancel Booking'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the laborer directly
              },
              child: Text('Call Laborer'),
            ),
          ],
        ),
      ),
    );
  }
}
