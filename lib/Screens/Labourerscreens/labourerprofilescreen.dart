import 'package:flutter/material.dart';
import 'package:mazdoor/Screens/bookingscreen.dart';
import '../bookinconfirimationscreen.dart';
import '../chatscreen.dart';
import 'chatscrn.dart';

class LaborerProfileScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String service;
  final double rating;
  final String location;
  final String experience;
  final String charges;

  const LaborerProfileScreen({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.service,
    required this.rating,
    required this.location,
    required this.experience,
    required this.charges,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laborer Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile image
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 16),
            // Name and service
            Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(service, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            const SizedBox(height: 8),

            // Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.orange),
                const SizedBox(width: 4),
                Text(rating.toString(), style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(height: 30),

            // Info List
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(location),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: Text('Experience: $experience'),
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: Text('Charges: $charges'),
            ),

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement call logic (e.g., url_launcher)
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text("Call"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Message screen with dummy image (or replace with actual)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreenLabrar(
                          laborerName: name,
                          laborerImage: imageUrl,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.message),
                  label: const Text("Message"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Book Now Button
            ElevatedButton(
              onPressed: () {
                // Replace with actual booking details model
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingConfirmationScreentwo(
                      worker: {
                        'name': name,
                        'service': service,
                        'imageUrl': imageUrl,
                        'rating': rating,
                        'location': location,
                        'experience': experience,
                        'charges': charges,
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
              child: const Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}
