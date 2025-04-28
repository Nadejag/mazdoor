import 'package:flutter/material.dart';
import 'package:mazdoor/Screens/settingsscreen.dart';

import 'editprofilescreen.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, String> userInfo = {
    'name': 'John Doe',
    'phone': '03001234567',
    'email': 'johndoe@email.com',
  };

  final List<Map<String, String>> jobHistory = [
    {'job': 'Plumbing', 'date': '2025-04-06', 'status': 'Completed'},
    {'job': 'Electrician', 'date': '2025-04-07', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );

            },
          ),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 10),
            Text(
              userInfo['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(userInfo['phone']!),
            Text(userInfo['email']!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Edit Profile
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
              },
              child: Text("Edit Profile"),
            ),
            SizedBox(height: 20),
            Text(
              "Job History",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: jobHistory.length,
                itemBuilder: (context, index) {
                  return JobHistoryCard(
                    job: jobHistory[index]['job']!,
                    date: jobHistory[index]['date']!,
                    status: jobHistory[index]['status']!,
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

class JobHistoryCard extends StatelessWidget {
  final String job;
  final String date;
  final String status;

  const JobHistoryCard({required this.job, required this.date, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        leading: Icon(Icons.history, color: Colors.green),
        title: Text(job, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('Date: $date\nStatus: $status', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
