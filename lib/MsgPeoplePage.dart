import 'package:flutter/material.dart';
import 'ChatScreen.dart';  // Import the ChatScreen widget

class MsgPeoplePage extends StatelessWidget {
  final String branch;
  final String year;

  // Non-constant list of people
  final List<Map<String, String>> people = [
    {'name': 'Shruti Tiwari', 'role': 'Machine Learning'},
    {'name': 'Maria Sayyad', 'role': 'Web Development'},
    // Add more people as needed
  ];

  MsgPeoplePage({Key? key, required this.branch, required this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$branch ($year)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Easy connect with your seniors',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: Text(
                          people[index]['name']![0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        people[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(people[index]['role']!),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _navigateToChatScreen(context, people[index]);
                        },
                        child: Text('Message'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToChatScreen(BuildContext context, Map<String, String> person) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          sender: 'You',  // Assuming 'You' are the current user
          receiver: person['name']!,
        ),
      ),
    );
  }
}
