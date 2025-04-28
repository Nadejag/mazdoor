import 'package:flutter/material.dart';

class AdminWorkerVerificationScreen extends StatelessWidget {
  const AdminWorkerVerificationScreen({super.key});

  final List<Map<String, String>> pendingWorkers = const [
    {
      'name': 'Ahmed Ali',
      'skills': 'Electrician, AC Repair',
      'cnic': '42101-1234567-8',
    },
    {
      'name': 'Saeed Khan',
      'skills': 'Plumber, Geyser Repair',
      'cnic': '42101-7654321-0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pending Worker Verifications")),
      body: ListView.builder(
        itemCount: pendingWorkers.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final worker = pendingWorkers[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(worker['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Skills: ${worker['skills']}'),
                  Text('CNIC: ${worker['cnic']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check_circle, color: Colors.green),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${worker['name']} approved')),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${worker['name']} rejected')),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
