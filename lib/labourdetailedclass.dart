// labor_detail_screen.dart
import 'package:flutter/material.dart';

import 'models/labour_model.dart';

class LaborDetailScreen extends StatelessWidget {
  final Labor labor;

  const LaborDetailScreen({Key? key, required this.labor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labor.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(labor.profileImage),
              ),
            ),
            SizedBox(height: 20),
            Text(
              labor.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  labor.rating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Skills',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Wrap(
              spacing: 8,
              children: labor.skills
                  .map((skill) => Chip(label: Text(skill)))
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement hire functionality
              },
              child: Text('Hire ${labor.name}'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}