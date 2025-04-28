import 'package:flutter/material.dart';

import 'bookingconfirmationscreen.dart';

class BookingScreen extends StatelessWidget {
  final String laborerName;

  BookingScreen({required this.laborerName});

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Service'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Booking Service with $laborerName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Select Date',
                hintText: 'DD/MM/YYYY',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () {
                // Show date picker
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: timeController,
              decoration: InputDecoration(
                labelText: 'Select Time',
                hintText: 'HH:MM',
                prefixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () {
                // Show time picker
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                hintText: 'Enter service location',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description (optional)',
                hintText: 'Additional details about the service',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit booking logic
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingConfirmationScreen(laborerName: laborerName, service: "as", date: 'd', time: '', location: '', price: 1,)));

              },
              child: Text('Confirm Booking'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Cancel booking logic
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Cancel Booking'),
            ),
          ],
        ),
      ),
    );
  }
}



class BookingDetailView extends StatelessWidget {
  const BookingDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Worker Info
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/2.jpg'),
                radius: 30,
              ),
              title: const Text('Ahmed Ali'),
              subtitle: const Text('Plumber'),
              trailing: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat),
                label: const Text('Chat'),
              ),
            ),
            const Divider(),

            // Booking Details
            detailRow(Icons.calendar_today, 'Date', 'April 10, 2025'),
            detailRow(Icons.access_time, 'Time', '2:00 PM'),
            detailRow(Icons.location_on, 'Address', 'House #12, Main Street, Karachi'),
            detailRow(Icons.note, 'Notes', 'Fix leaking sink. Bring replacement parts.'),
            detailRow(Icons.info, 'Status', 'Confirmed'),

            const Spacer(),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Reschedule'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Rate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
