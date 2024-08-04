import 'package:flutter/material.dart';
import 'package:jobs_app/views/profile_setting/profile.dart';

class Notification3 extends StatefulWidget {
  const Notification3({super.key});

  @override
  _Notification3State createState() => _Notification3State();
}

class _Notification3State extends State<Notification3> {
  bool jobSearchAlert = true;
  bool jobApplicationUpdate = false;
  bool jobApplicationReminders = false;
  bool jobsInterestedIn = true;
  bool jobSeekerUpdates = false;
  bool showProfile = true;
  bool allMessages = true;
  bool messageNudges = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Profile()),   );
          },
        ),
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height:32 ,),
          Container(
            height: 37,
            width: 115,
            color: Color(0xFFE5E7EB),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Job notification', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          SizedBox(height:12 ,),
          SwitchListTile(
            title: Text('Your Job Search Alert'),
            value: jobSearchAlert,
            onChanged: (bool value) {
              setState(() {
                jobSearchAlert = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFFD1D5DB)),
          ),
          SwitchListTile(
            title: Text('Job Application Update'),
            value: jobApplicationUpdate,
            onChanged: (bool value) {
              setState(() {
                jobApplicationUpdate = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFFD1D5DB)),
          ),
          SwitchListTile(
            title: Text('Job Application Reminders'),
            value: jobApplicationReminders,
            onChanged: (bool value) {
              setState(() {
                jobApplicationReminders = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFFD1D5DB)),
          ),
          SwitchListTile(
            title: Text('Jobs You May Be Interested In'),
            value: jobsInterestedIn,
            onChanged: (bool value) {
              setState(() {
                jobsInterestedIn = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFFD1D5DB)),
          ),
          SwitchListTile(
            title: Text('Job Seeker Updates'),
            value: jobSeekerUpdates,
            onChanged: (bool value) {
              setState(() {
                jobSeekerUpdates = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFFD1D5DB)),
          ),
          SizedBox(height: 32,),
          Container(
            height: 37,
            width: 115,
            color: Color(0xFFE5E7EB),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Other notification', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          SwitchListTile(
            title: Text('Show Profile'),
            value: showProfile,
            onChanged: (bool value) {
              setState(() {
                showProfile = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFFD1D5DB)),
          ),
          SwitchListTile(
            title: Text('All Message'),
            value: allMessages,
            onChanged: (bool value) {
              setState(() {
                allMessages = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFFD1D5DB)),
          ),
          SwitchListTile(
            title: Text('Message Nudges'),
            value: messageNudges,
            onChanged: (bool value) {
              setState(() {
                messageNudges = value;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(color: Color(0xFFD1D5DB)),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Notification3(),
  ));
}
