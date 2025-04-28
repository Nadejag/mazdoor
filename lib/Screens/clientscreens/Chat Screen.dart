import 'package:flutter/material.dart';

class ChatScreentw extends StatefulWidget {
  final String workerName;
  const ChatScreentw({super.key, required this.workerName});

  @override
  State<ChatScreentw> createState() => _ChatScreentwState();
}

class _ChatScreentwState extends State<ChatScreentw> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [
    {'sender': 'client', 'text': 'Hello! Are you available today?'},
    {'sender': 'worker', 'text': 'Yes, I’m free after 2 PM.'},
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'client', 'text': text});
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workerName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isClient = message['sender'] == 'client';

                return Align(
                  alignment: isClient ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(maxWidth: 250),
                    decoration: BoxDecoration(
                      color: isClient ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(message['text'] ?? ''),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
