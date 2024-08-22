import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/apply_job/accepted.dart';
import 'package:jobs_app/views/messages/message2.dart';
import 'package:jobs_app/views/saved/save_job.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Accepted()),
            );
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/Twitter Logo.png'),
            ),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                'Twitter',
                style: TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {
              _showOptionsBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Today, Nov 13',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 8),
                _buildReceivedMessage(
                    'Hi Rafif, I\'m Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.',
                    '10:18',
                    rightPadding: 99.0,
                    leftPadding: 4.0),
                _buildSentMessage(
                    'Hi Melan, thank you for considering me, this is good news for me.',
                    '10:18',
                    rightPadding: 44.0,
                    leftPadding: 90.0),
                _buildReceivedMessage(
                    'Can we have an interview via google meet call today at 3pm?',
                    '10:18',
                    rightPadding: 99.0,
                    leftPadding: 4.0),
                _buildSentMessage('Of course, I can!', '10:18',
                    rightPadding: 44.0, leftPadding: 150.0),
                _buildReceivedMessageWithLink(
                    'Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you!',
                    '10:18',
                    'https://meet.google.com/dis-sxdu-ave',
                    rightPadding: 99.0,
                    leftPadding: 4.0),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildOptionItem(
                  context,
                  iconPath: 'assets/svg/briefcase.svg',
                  text: 'Visit job post',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SaveJob()),
                    );
                  },
                ),
                _buildOptionItem(
                  context,
                  iconPath: 'assets/svg/note.svg',
                  text: 'View my application',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildOptionItem(
                  context,
                  iconPath: 'assets/svg/sms.svg',
                  text: 'Mark as unread',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildOptionItem(
                  context,
                  iconPath: 'assets/svg/notification.svg',
                  text: 'Mute',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildOptionItem(
                  context,
                  iconPath: 'assets/svg/import.svg',
                  text: 'Archive',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildOptionItem(
                  context,
                  iconPath: 'assets/svg/trash.svg',
                  text: 'Delete conversation',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionItem(BuildContext context,
      {required String iconPath,
        required String text,
        required VoidCallback onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: SvgPicture.asset(iconPath, width: 24, height: 24),
        title: Text(text),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _buildReceivedMessage(String message, String time,
      {double rightPadding = 0, double leftPadding = 0}) {
    return Padding(
      padding: EdgeInsets.only(
          right: rightPadding, left: leftPadding, top: 4.0, bottom: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 4.0),
              Text(
                time,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReceivedMessageWithLink(String message, String time, String link,
      {double rightPadding = 0, double leftPadding = 0}) {
    return Padding(
      padding: EdgeInsets.only(
          right: rightPadding, left: leftPadding, top: 4.0, bottom: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: message + '\n'),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          // Handle link tap
                        },
                        child: Text(
                          link,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                time,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSentMessage(String message, String time,
      {double rightPadding = 0, double leftPadding = 0}) {
    return Padding(
      padding: EdgeInsets.only(
          right: rightPadding, left: leftPadding, top: 4.0, bottom: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 4.0),
              Text(
                time,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.grey),
            onPressed: () {
              // Handle attachment
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.mic, color: Colors.grey),
            onPressed: () {
              // Handle voice input
            },
          ),
        ],
      ),
    );
  }
}
