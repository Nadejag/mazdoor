import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationItem {
  final String title;
  final String subtitle;
  final DateTime time;
  final IconData icon;
  final String type;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.type,
    this.isRead = false,
  });
}

class EnhancedNotificationsScreen extends StatefulWidget {
  @override
  _EnhancedNotificationsScreenState createState() => _EnhancedNotificationsScreenState();
}

class _EnhancedNotificationsScreenState extends State<EnhancedNotificationsScreen> {
  String selectedFilter = 'All';

  List<NotificationItem> allNotifications = [
    NotificationItem(
      title: 'Booking Confirmed',
      subtitle: 'Your booking with Ali Electrician is confirmed.',
      time: DateTime.now().subtract(Duration(hours: 1)),
      icon: Icons.check_circle,
      type: 'Booking',
    ),
    NotificationItem(
      title: 'New Message',
      subtitle: 'Ali Electrician: "See you at 3PM"',
      time: DateTime.now().subtract(Duration(hours: 3)),
      icon: Icons.message,
      type: 'Message',
    ),
    NotificationItem(
      title: 'Job Completed',
      subtitle: 'Ali Electrician marked the job as completed.',
      time: DateTime.now().subtract(Duration(days: 1, hours: 2)),
      icon: Icons.work,
      type: 'Job',
    ),
    NotificationItem(
      title: 'Reminder',
      subtitle: 'Your booking with the plumber is tomorrow.',
      time: DateTime.now().subtract(Duration(days: 3)),
      icon: Icons.alarm,
      type: 'Booking',
    ),
  ];

  List<String> filterOptions = ['All', 'Booking', 'Message', 'Job'];

  @override
  Widget build(BuildContext context) {
    final filtered = selectedFilter == 'All'
        ? allNotifications
        : allNotifications.where((n) => n.type == selectedFilter).toList();

    final grouped = {
      'Today': filtered.where((n) => isToday(n.time)).toList(),
      'Yesterday': filtered.where((n) => isYesterday(n.time)).toList(),
      'Older': filtered.where((n) => isOlder(n.time)).toList(),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          DropdownButton<String>(
            value: selectedFilter,
            underline: SizedBox(),
            icon: Icon(Icons.filter_list, color: Colors.white),
            dropdownColor: Colors.white,
            onChanged: (value) {
              setState(() {
                selectedFilter = value!;
              });
            },
            items: filterOptions.map((filter) {
              return DropdownMenuItem(
                value: filter,
                child: Text(filter),
              );
            }).toList(),
          )
        ],
      ),
      body: ListView(
        children: grouped.entries.expand<Widget>((entry) {
          if (entry.value.isEmpty) return [];
          return [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(entry.key, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            ...entry.value.map((n) => Dismissible(
              key: Key(n.title + n.time.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (_) {
                setState(() {
                  allNotifications.remove(n);
                });
              },
              child: ListTile(
                leading: Icon(n.icon, color: Colors.blue),
                title: Text(n.title),
                subtitle: Text(n.subtitle),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(DateFormat.jm().format(n.time), style: TextStyle(fontSize: 12)),
                    if (!n.isRead)
                      Icon(Icons.circle, color: Colors.blueAccent, size: 10),
                  ],
                ),
                onTap: () {
                  setState(() {
                    n.isRead = true;
                  });
                  // Navigate to related screen if needed
                },
              ),
            ))
          ];
        }).toList(),
      ),
    );
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.day == now.day && date.month == now.month && date.year == now.year;
  }

  bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return date.day == yesterday.day &&
        date.month == yesterday.month &&
        date.year == yesterday.year;
  }

  bool isOlder(DateTime date) {
    return date.isBefore(DateTime.now().subtract(Duration(days: 1)));
  }
}
