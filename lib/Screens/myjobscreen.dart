import 'package:flutter/material.dart';

class MyJobsScreen extends StatelessWidget {
  final List<Map<String, String>> jobs = [
    {'title': 'Plumbing', 'date': '2025-04-06', 'status': 'Pending'},
    {'title': 'Electrician', 'date': '2025-04-07', 'status': 'Completed'},
    {'title': 'Carpentry', 'date': '2025-04-08', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Jobs'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Your Active Jobs",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  return JobCard(
                    title: jobs[index]['title']!,
                    date: jobs[index]['date']!,
                    status: jobs[index]['status']!,
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

class JobCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;

  const JobCard({required this.title, required this.date, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        leading: Icon(Icons.work, color: Colors.green),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('Date: $date\nStatus: $status', style: TextStyle(fontSize: 16)),
        trailing: status == 'Pending'
            ? ElevatedButton(
          onPressed: () {
            // Handle job cancellation or rescheduling
          },
          child: Text('Cancel/Reschedule'),
        )
            : null,
      ),
    );
  }
}
