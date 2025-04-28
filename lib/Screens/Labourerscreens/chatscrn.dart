import 'package:flutter/material.dart';

class ChatScreenLabrar extends StatefulWidget {
  final String laborerName;
  final String laborerImage;

  ChatScreenLabrar({required this.laborerName, required this.laborerImage});

  @override
  _ChatScreenLabrarState createState() => _ChatScreenLabrarState();
}

class _ChatScreenLabrarState extends State<ChatScreenLabrar> {
  final List<Map<String, dynamic>> messages = [
    {'message': 'Hello, are you available?', 'isUser': true},
    {'message': 'Yes, I am free tomorrow.', 'isUser': false},
  ];
  final TextEditingController _controller = TextEditingController();

  void sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      messages.add({'message': _controller.text.trim(), 'isUser': true});
      _controller.clear();
    });
    // Simulate reply
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        messages.add({'message': 'Got it. I’ll be there.', 'isUser': false});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(widget.laborerImage)),
            SizedBox(width: 8),
            Text(widget.laborerName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg['isUser']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: msg['isUser'] ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(msg['message']),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
