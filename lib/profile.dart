import 'package:flutter/material.dart';
import 'ChangePassword.dart';
import 'editUser.dart';
import 'domain.dart';
import 'MsgPeoplePage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEDF2F7),
                  image: DecorationImage(
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: Color(0xFF2C467B), width: 5),
                ),
                width: 200,
                height: 200,
              ),
              SizedBox(height: 50),
              Text(
                "Pooja Arora",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C467B),
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfile()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF87CEEB), // Text color
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        textStyle: TextStyle(fontSize: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Edit User"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 7.0),
                      child: Container(
                        height: 1.0,
                        width: double.maxFinite,
                        color: Color(0xFF032B44), // Navy blue
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF87CEEB), // Text color
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        textStyle: TextStyle(fontSize: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Change Password"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 7.0),
                      child: Container(
                        height: 1.0,
                        width: double.maxFinite,
                        color: Color(0xFF032B44), // Navy blue
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF87CEEB), // Text color
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        textStyle: TextStyle(fontSize: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Notification Settings"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 18, color: Colors.blue),
        unselectedLabelStyle: TextStyle(fontSize: 18, color: Colors.grey),
        selectedIconTheme: IconThemeData(size: 30, color: Colors.blue),
        unselectedIconTheme: IconThemeData(size: 30, color: Colors.grey),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration, size: 30),
            label: 'Domain',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail, size: 30),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        ],
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyDomain()),
            );
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
          }
        },
      ),
    );
  }
}
