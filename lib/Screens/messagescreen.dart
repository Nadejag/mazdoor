import 'package:flutter/material.dart';

import 'chatscreen.dart';

class MessagesScreen extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {'name': 'Ali (Plumber)', 'lastMessage': 'I’m on my way', 'time': '10:30 AM'},
    {'name': 'Ahmed (Electrician)', 'lastMessage': 'Finished the work', 'time': '9:45 AM'},
    {'name': 'Sara (Carpenter)', 'lastMessage': 'Can I come tomorrow?', 'time': 'Yesterday'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return MessageCard(
              name: messages[index]['name']!,
              lastMessage: messages[index]['lastMessage']!,
              time: messages[index]['time']!,
            );
          },
        ),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;

  const MessageCard({required this.name, required this.lastMessage, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(lastMessage),
        trailing: Text(time, style: TextStyle(color: Colors.grey)),
        onTap: () {
          // Open chat screen
          // Navigator.pushNamed(context, '/chat');
          Navigator.push(context,MaterialPageRoute(builder:  (context)=>ChatScreen()));
        },
      ),
    );
  }
}
