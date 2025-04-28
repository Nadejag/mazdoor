import 'package:flutter/material.dart';

class WorkerStatusToggleScreen extends StatefulWidget {
  const WorkerStatusToggleScreen({super.key});

  @override
  State<WorkerStatusToggleScreen> createState() => _WorkerStatusToggleScreenState();
}

class _WorkerStatusToggleScreenState extends State<WorkerStatusToggleScreen> {
  bool isOnline = true;

  void _toggleStatus(bool value) {
    setState(() {
      isOnline = value;

      // TODO: Save status to backend or local storage
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Status updated to ${isOnline ? 'Online' : 'Offline'}'),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set Availability')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              isOnline ? Icons.check_circle : Icons.cancel,
              color: isOnline ? Colors.green : Colors.red,
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'You are currently ${isOnline ? 'Online' : 'Offline'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            SwitchListTile(
              title: const Text('Toggle Status'),
              subtitle: const Text('Enable or disable availability'),
              value: isOnline,
              onChanged: _toggleStatus,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
