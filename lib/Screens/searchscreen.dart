import 'package:flutter/material.dart';

import '../models/workerdata.dart';
import 'Labourerscreens/labourerprofilescreen.dart';
import 'bookingscreen.dart';

class SearchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Laborers & Services'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for a service...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add filter functionality
              },
              child: Text('Apply Filters'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  return WorkerCard(
                    name: workers[index]['name']!,
                    service: workers[index]['service']!,
                    location: workers[index]['location']!,
                    rating: workers[index]['rating']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkerCard extends StatelessWidget {
  final String name;
  final String service;
  final String location;
  final String rating;

  const WorkerCard({
    required this.name,
    required this.service,
    required this.location,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
  int index=0;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('$service - $location'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.orange),
            Text(rating),
          ],
        ),
        onTap: () {
          // Inside the worker's detailed profile page
          // ElevatedButton(
          //   onPressed: () {
              // Navigate to BookingScreen from the profile screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                //    BookingScreen(laborerName:name)
                LaborerProfileScreen(name: name, imageUrl: '', service: '', rating: 4.5, location: '', experience: '', charges: '',)
                ),
              );
           // },
          //   child: Text('Book Service'),
          // );
        },
      ),
    );
  }
}
