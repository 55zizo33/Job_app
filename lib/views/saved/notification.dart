import 'package:flutter/material.dart';
import 'package:jobs_app/views/saved/empety_state.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmpetyState()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 11), // إضافة الفاصل هنا
          Expanded(
            child: ListView(
              children: [
                SectionHeader(title: 'New'),
                NotificationTile(
                  iconPath: 'assets/images/Dana Logo.png',
                  title: 'Dana',
                  subtitle: 'Posted new design jobs',
                  time: '10.00AM',
                  isNew: true,
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                NotificationTile(
                  iconPath: 'assets/images/Shoope Logo.png',
                  title: 'Shoope',
                  subtitle: 'Posted new design jobs',
                  time: '10.00AM',
                  isNew: true,
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                NotificationTile(
                  iconPath: 'assets/images/Slack Logo.png',
                  title: 'Slack',
                  subtitle: 'Posted new design jobs',
                  time: '10.00AM',
                  isNew: true,
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                NotificationTile(
                  iconPath: 'assets/images/Facebook Logo.png',
                  title: 'Facebook',
                  subtitle: 'Posted new design jobs',
                  time: '10.00AM',
                  isNew: true,
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                SectionHeader(title: 'Yesterday'),
                NotificationTile(
                  iconPath: 'assets/images/sms.png',
                  title: 'Email setup successful',
                  subtitle:
                  'Your email setup was successful with the following details: Your new email is rafididlanganzy@gmail.com.',
                  time: '10.00AM',
                  isNew: false,
                  isCircleAvatar: true,
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                NotificationTile(
                  iconPath: 'assets/images/search-status.png',
                  title: 'Welcome to Jobsque',
                  subtitle:
                  'Hello Rafif Dian Axeliroga, thank you for registering Jobsque. Enjoy the various features that...',
                  time: '08.00AM',
                  isNew: false,
                  isCircleAvatar: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final String time;
  final bool isNew;
  final bool isCircleAvatar;

  const NotificationTile({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isNew,
    this.isCircleAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isCircleAvatar
          ? CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Image.asset(iconPath, width: 24, height: 24),
      )
          : Image.asset(iconPath, width: 40, height: 40),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isNew) Icon(Icons.circle, size: 10, color: Colors.yellow),
          SizedBox(width: 4),
          Text(time, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationView(),
  ));
}
