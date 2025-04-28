// labor_card.dart
import 'package:flutter/material.dart';

import 'models/labour_model.dart';


class LaborCard extends StatelessWidget {
  final Labor labor;

  LaborCard({required this.labor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(labor.profileImage),
        ),
        title: Text(labor.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(labor.skills.join(', ')),
            Text('${labor.distance.toStringAsFixed(1)} km away'),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Text(labor.rating.toStringAsFixed(1)),
              ],
            ),
          ],
        ),
        trailing: ElevatedButton(
          child: Text('Hire'),
          onPressed: () => _showHireDialog(context),
        ),
      ),
    );
  }

  void _showHireDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Hire ${labor.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Job Details'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Duration'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(ctx),
          ),
          ElevatedButton(
            child: Text('Confirm Hire'),
            onPressed: () {
              // Implement hire logic
              Navigator.pop(ctx);
            },
          ),
        ],
      ),
    );
  }
}