import 'package:flutter/material.dart';

class WorkerReviewsScreen extends StatelessWidget {
  const WorkerReviewsScreen({super.key});

  final List<Map<String, dynamic>> reviews = const [
    {
      'name': 'Customer A',
      'comment': 'Great electrician! Quick and professional.',
      'rating': 5,
      'date': 'Apr 6, 2025'
    },
    {
      'name': 'Customer B',
      'comment': 'Good work, but came 30 minutes late.',
      'rating': 3,
      'date': 'Apr 4, 2025'
    },
    {
      'name': 'Customer C',
      'comment': 'Satisfied with the service.',
      'rating': 4,
      'date': 'Apr 1, 2025'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Client Reviews")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: reviews.length,
        separatorBuilder: (_, __) => const Divider(height: 24),
        itemBuilder: (context, index) {
          final review = reviews[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Text(review['name'][0]),
            ),
            title: Text(review['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(review['comment']),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                        (i) => Icon(
                      i < review['rating'] ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            trailing: Text(
              review['date'],
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
