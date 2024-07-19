import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MsgPeoplePage.dart';
import 'domain.dart';

import 'profile.dart';

class SelectYearScreen extends StatefulWidget {
  final String branch;

  const SelectYearScreen({Key? key, required this.branch}) : super(key: key);

  @override
  State<SelectYearScreen> createState() => _SelectYearScreenState();
}

class _SelectYearScreenState extends State<SelectYearScreen> {
  String? _selectedYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(' ${widget.branch}'),
        actions: const [
          Icon(Icons.signal_cellular_alt),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please select Year',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: _selectedYear,
                  hint: const Text('Search'),
                  isExpanded: true,
                  underline: const SizedBox(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedYear = newValue;
                      if (_selectedYear != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MsgPeoplePage(
                              branch: widget.branch,
                              year: _selectedYear!,
                            ),
                          ),
                        );
                      }
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: '2016-2020',
                      child: Text('2016-2020'),
                    ),
                    DropdownMenuItem(
                      value: '2017-2021',
                      child: Text('2017-2021'),
                    ),
                    DropdownMenuItem(
                      value: '2018-2022',
                      child: Text('2018-2022'),
                    ),
                    DropdownMenuItem(
                      value: '2019-2023',
                      child: Text('2019-2023'),
                    ),
                    DropdownMenuItem(
                      value: '2020-2024',
                      child: Text('2020-2024'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.compass),
            label: 'Domains',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.envelope),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, 
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyDomain()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MsgPeoplePage(
                    branch: widget.branch,
                    year: _selectedYear ?? 'Unknown Year',
                  ),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
