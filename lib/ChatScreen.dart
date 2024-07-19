import 'package:flutter/material.dart';
import 'profile.dart'; // Import the ProfilePage file

class ChatScreen extends StatefulWidget {
  final String sender;
  final String receiver;

  ChatScreen({Key? key, required this.sender, required this.receiver}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> _messages = []; // will be populated from server or database
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _retrieveMessages();
  }

  void _retrieveMessages() async {
    // TO DO: implement logic to retrieve messages from server or database
    // for now, just simulate retrieving messages
    setState(() {
      _messages = [
        {'sender': widget.receiver, 'text': 'Hey ${widget.sender}!', 'time': DateTime.now()},
        {'sender': widget.sender, 'text': 'Hello ${widget.receiver}', 'time': DateTime.now()},
        {'sender': widget.receiver, 'text': "How's your day going?", 'time': DateTime.now()},
        {'sender': widget.sender, 'text': "It's going well. Thanks for asking!", 'time': DateTime.now()},
        {'sender': widget.receiver, 'text': "That's good to hear 🙂", 'time': DateTime.now()},
      ];
    });
  }

  void _sendMessage() {
    // Get the user input
    String userInput = _textController.text;
    // TO DO: implement logic to send message to server or database
    // for now, just simulate sending message
    setState(() {
      _messages.add({
        'sender': widget.sender,
        'text': userInput,
        'time': DateTime.now(),
      });
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            '${widget.receiver}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black), // Change icon color to black
            onPressed: () {
              // Navigate to profile screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()), // Ensure ProfilePage is properly imported
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Change back button color to black
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false, // Set to false to display messages from top to bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool isMe = _messages[index]['sender'] == widget.sender;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _messages[index]['text'],
                            style: TextStyle(
                              color: isMe ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${_messages[index]['sender']} • ${_formatTimestamp(_messages[index]['time'])}',
                            style: TextStyle(
                              color: isMe ? Colors.white70 : Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type a message...',
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _sendMessage,
                child: Text('Send'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime time) {
    // Format timestamp to HH:mm (24-hour format)
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
