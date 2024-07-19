import 'package:flutter/material.dart';
import 'profile.dart';
import 'MsgPeoplePage.dart';

class MyDomain extends StatefulWidget {
  const MyDomain({Key? key}) : super(key: key);

  @override
  _MyDomainState createState() => _MyDomainState();
}

class _MyDomainState extends State<MyDomain> {
  List<String> values = [
    'assets/web.png',
    'assets/appdevelop.jpg',
    'assets/blockchain.jpg',
    'assets/machineLearning.jpg',
    'assets/datascience.png',
    'assets/29.jpg'
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Technologies',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Chat with seniors across various domains',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onGridItemTapped(index);
                  },
                  child: Card(
                    elevation: 6,
                    child: Center(
                      child: Image.asset(
                        values[index],
                        width: 200,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'Domains',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            // Already on the Domain page, do nothing
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MsgPeoplePage(
                  branch: 'Your Branch', // Replace with the actual branch
                  year: 'Your Year', // Replace with the actual year
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }

  void _onGridItemTapped(int index) {
    print('Grid item $index tapped');
  }
}
