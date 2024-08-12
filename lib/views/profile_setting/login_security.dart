import 'package:flutter/material.dart';
import 'package:jobs_app/views/profile_setting/profile.dart';
import 'package:jobs_app/views/profile_setting/email_address.dart'; // Import EmailAddress
import 'package:jobs_app/views/profile_setting/phone_number.dart'; // Import PhoneNumber
import 'package:jobs_app/views/profile_setting/change_password.dart'; // Import ChangePassword
import 'package:jobs_app/views/profile_setting/two_step_verification.dart'; // Import TwoStepVerification

class LoginSecurity extends StatelessWidget {
  const LoginSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
        title: Text('Login and Security'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.centerLeft,
            color: Color(0xFFE5E7EB),
            child: Text('Account access', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Email address')),
                SizedBox(width: 12),
                Text('rafidrian12@gmail.com', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmailAddress()), // Navigate to EmailAddress
              );
            },
          ),
          Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
          ListTile(
            title: Text('Phone number'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PhoneNumber()), // Navigate to PhoneNumber
              );
            },
          ),
          Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
          ListTile(
            title: Text('Change password'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePassword()), // Navigate to ChangePassword
              );
            },
          ),
          Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Two-step verification')),
                Text('Non active', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TwoStepVerification()), // Navigate to TwoStepVerification
              );
            },
          ),
          Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
          ListTile(
            title: Text('Face ID'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Handle the tap event
            },
          ),
          Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
        ],
      ),
    );
  }
}


