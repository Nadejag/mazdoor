import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazdoor/Screens/bookingscreen.dart';

import 'labourerprofilescreen.dart';

class WorkerListScreen extends StatelessWidget {
  final String categoryName;

  WorkerListScreen({required this.categoryName});

  final List<Map<String, dynamic>> workers = [
    {
      'name': 'Ali Electrician',
      'rating': 4.5,
      'location': 'Karachi',
      'experience': '3 years',
      'charges': 'Rs. 1000/day',
    },
    {
      'name': 'Hamza Electrician',
      'rating': 4.0,
      'location': 'Hyderabad',
      'experience': '2 years',
      'charges': 'Rs. 900/day',
    },
    {
      'name': 'Usman Electrician',
      'rating': 4.8,
      'location': 'Sukkur',
      'experience': '5 years',
      'charges': 'Rs. 1200/day',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$categoryName Workers')),
      body: ListView.builder(
        itemCount: workers.length,
        itemBuilder: (context, index) {
          final worker = workers[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person, size: 30),
              ),
              title: Text(worker['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('⭐ ${worker['rating']}   •   ${worker['experience']}'),
                  Text('📍 ${worker['location']}   •   💰 ${worker['charges']}'),
                ],
              ),
              trailing: ElevatedButton(
                child: Text('Book'),
                onPressed: () {
                  // Navigate to BookingScreen or WorkerDetailScreen
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingScreen(laborerName: "")));
                },
              ),
              onTap: () {
                // Optional: Navigate to worker profile
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LaborerProfileScreen(name: '', imageUrl: '', service: '', rating: 4.3, location: '', experience: '', charges: '',)));
              },
            ),
          );
        },
      ),
    );
  }
}
