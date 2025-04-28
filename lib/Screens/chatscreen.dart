import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final List<Map<String, String>> messages = [
    {'sender': 'You', 'message': 'Hello, when can you come?'},
    {'sender': 'Ali (Plumber)', 'message': 'I’ll be there in 30 minutes.'},
    {'sender': 'You', 'message': 'Thanks!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Ali (Plumber)'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  sender: messages[index]['sender']!,
                  message: messages[index]['message']!,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Send message
                    setState(() {
                      messages.add({
                        'sender': 'You',
                        'message': messageController.text,
                      });
                      messageController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String message;

  const MessageBubble({required this.sender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Align(
        alignment: sender == 'You' ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: sender == 'You' ? Colors.green[100] : Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: sender == 'You' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
