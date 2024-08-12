import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/messages/message2.dart';
import 'package:jobs_app/views/messages/message4.dart';

class Message3 extends StatefulWidget {
  const Message3({super.key});

  @override
  _Message3State createState() => _Message3State();
}

class _Message3State extends State<Message3> {
  int _currentIndex = 1;
  bool showUnread = true; // لعرض الرسائل غير المقروءة فقط
  List<Message> messages = [
    Message('Twitter', 'Here is the link: http://zoom.com/abcodefg', '12.39', 'assets/images/Twitter Logo.png', true),
    Message('Gojek Indonesia', 'Let\'s keep in touch.', '12.39', 'assets/images/Gojek Logo.png', true),
    Message('Shoope', 'Thank You David!', '09.45', 'assets/images/Shoope Logo.png', false),
    Message('Dana', 'Thank you for your attention!', 'Yesterday', 'assets/images/Dana Logo.png', true),
    Message('Slack', 'You: I look forward to hearing from you', '12/8', 'assets/images/Slack Logo.png', false),
    Message('Facebook', 'You: What about the interview stage?', '12/8', 'assets/images/Facebook Logo.png', false),
  ];

  @override
  Widget build(BuildContext context) {
    List<Message> displayedMessages = showUnread
        ? messages.where((message) => message.hasNotification).toList()
        : messages;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Message2()),
            );
          },
        ),
      )
      ,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search messages...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {
                      setState(() {
                        displayedMessages = displayedMessages
                            .where((message) =>
                        message.sender.toLowerCase().contains(value.toLowerCase()) ||
                            message.message.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Image.asset('assets/images/setting-4.png', width: 24, height: 24),
                  onPressed: () {
                    // إظهار نافذة التصفية
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Message filters',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16), // Add spacing between title and filters
                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(color: Colors.grey, width: 0.5),
                                ),
                                child: ListTile(
                                  title: Text('Unread'),
                                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Message3()), // Navigate to Message3
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(color: Colors.grey, width: 0.5),
                                ),
                                child: ListTile(
                                  title: Text('Spam'),
                                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                  onTap: () {
                                    Navigator.pop(context);
// تنفيذ التصفية للرسائل غير الهامة
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(color: Colors.grey, width: 0.5),
                                ),
                                child: ListTile(
                                  title: Text('Archived'),
                                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Message4()), // Navigate to Message4
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      showUnread = true;
                    });
                  },
                  child: Text(
                    'Unread',
                    style: TextStyle(
                      color: showUnread ? Colors.blue : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      showUnread = false;
                    });
                  },
                  child: Text(
                    'Read all messages',
                    style: TextStyle(
                      color: !showUnread ? Colors.blue : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedMessages.length,
              itemBuilder: (context, index) {
                return MessageTile(
                  sender: displayedMessages[index].sender,
                  message: displayedMessages[index].message,
                  time: displayedMessages[index].time,
                  iconPath: displayedMessages[index].iconPath,
                  hasNotification: displayedMessages[index].hasNotification,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Container(
              decoration: BoxDecoration(
                color: Color(0xFF3366FF),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/svg/home.svg',
                color: Colors.white,
              ),
            )
                : SvgPicture.asset(
              'assets/svg/home.svg',
              color: Color(0xFF9CA3AF),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Container(
              decoration: BoxDecoration(
                color: Color(0xFF3366FF),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/svg/message.svg',
                color: Colors.white,
              ),
            )
                : SvgPicture.asset(
              'assets/svg/message.svg',
              color: Color(0xFF9CA3AF),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Container(
              decoration: BoxDecoration(
                color: Color(0xFF3366FF),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/svg/briefcase.svg',
                color: Colors.white,
              ),
            )
                : SvgPicture.asset(
              'assets/svg/briefcase.svg',
              color: Color(0xFF9CA3AF),
            ),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Container(
              decoration: BoxDecoration(
                color: Color(0xFF3366FF),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/svg/archive-minus.svg',
                color: Colors.white,
              ),
            )
                : SvgPicture.asset(
              'assets/svg/archive-minus.svg',
              color: Color(0xFF9CA3AF),
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? Container(
              decoration: BoxDecoration(
                color: Color(0xFF3366FF),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/svg/profile (1).svg',
                color: Colors.white,
              ),
            )
                : SvgPicture.asset(
              'assets/svg/profile (1).svg',
              color: Color(0xFF9CA3AF),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF3366FF),
        unselectedItemColor: Color(0xFF9CA3AF),
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print('Selected index: $_currentIndex');
          });
        },
      ),
    );
  }
}

class Message {
  final String sender;
  final String message;
  final String time;
  final String iconPath;
  final bool hasNotification;

  Message(this.sender, this.message, this.time, this.iconPath, this.hasNotification);
}

class MessageTile extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final String iconPath;
  final bool hasNotification;

  const MessageTile({
    required this.sender,
    required this.message,
    required this.time,
    required this.iconPath,
    required this.hasNotification,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(iconPath),
          ),
          if (hasNotification)
            Positioned(
              left: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(sender, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

