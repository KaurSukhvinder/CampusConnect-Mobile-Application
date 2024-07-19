import 'package:flutter/material.dart';
import 'domain.dart';
import 'profile.dart';
import 'MsgPeoplePage.dart'; // Import the MsgPeoplePage widget

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int _selectedIndex = 2; // Set the initial selected index to 'Profile'

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation or actions based on the selected index
    if (index == 0) {
      // Navigate to Domains page
    } else if (index == 1) {
      // Navigate to Inbox page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MsgPeoplePage(
            branch: 'Your Branch', // Replace with actual branch
            year: 'Your Year', // Replace with actual year
          ),
        ),
      );
    } else if (index == 2) {
      // Do nothing (or navigate to Profile page)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Changed appbar background to white
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Color(0xFF000000)), // Changed back button color to black
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Color(0xFF0A66C2), fontSize: 18), // Changed text color to blue
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: Color(0xFF0A66C2), width: 5), // Changed border color to blue
                ),
                width: 150,
                height: 150,
              ),
              SizedBox(height: 7),
              // Removed Change Photo button
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Kept the white background for the input fields
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontSize: 15, color: Color(0xFF0A66C2)), // Changed text color to blue
                    ),
                    SizedBox(height:10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter New Name",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 15, color: Color(0xFF0A66C2)), // Changed text color to blue
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter New Email",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Location',
                      style: TextStyle(fontSize: 15, color: Color(0xFF0A66C2)), // Changed text color to blue
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter New Location",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 15, color: Color(0xFF0A66C2)), // Changed text color to blue
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter New Phone Number",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2CABDE), Color(0xFF2CABDE)], // Kept the original gradient colors for the button
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(0),
                child: ElevatedButton(
                  child: Text('Save Changes', style: TextStyle(color: Colors.white)), // Changed text color to white
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF0F0F0), // Changed background color to light grey
        selectedItemColor: Colors.blueAccent, // Kept the blue selected color
        unselectedItemColor: Colors.grey, // Kept the grey unselected color
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'Domains',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}