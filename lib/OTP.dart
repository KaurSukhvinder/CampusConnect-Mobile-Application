import 'package:flutter/material.dart';
import 'BranchPage.dart';



class OTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTP Verification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OtpPage(),
      
      
    );
  }
}

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());

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
        title: Text('OTP Verification'),
        actions: const [
          Icon(Icons.signal_cellular_alt),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0), // Added side padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter confirmation code',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'A 4-digit code was sent to your gmail',
                style: TextStyle(fontSize: 14),
              ),
              
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextField(
                        controller: _otpControllers[i],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Verify OTP logic here
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BranchPage()),
                  );
                },
                child: Text('Continue'),
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: () {
                  // Resend OTP logic here
                  
                },
                child: Text('Resend code'),
              ),
              SizedBox(height: 32),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 1; i <= 9; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Added padding
                      child: ElevatedButton(
                        onPressed: () {
                          for (int j = 0; j < _otpControllers.length; j++) {
                            if (_otpControllers[j].text.isEmpty) {
                              _otpControllers[j].text = i.toString();
                              break;
                            }
                          }
                        },
                        child: Text(i.toString()),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(30, 20), // Reduced button size
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}