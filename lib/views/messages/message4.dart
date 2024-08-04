import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_app/views/messages/message3.dart';

class Message4 extends StatefulWidget {
  const Message4({super.key});

  @override
  State<Message4> createState() => _Message4State();
}

class _Message4State extends State<Message4> {
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
              MaterialPageRoute(builder: (context) => Message3()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                                ListTile(
                                  leading: Icon(Icons.mail),
                                  title: Text('Unread'),
                                  onTap: () {
                                    // تنفيذ التصفية للرسائل غير المقروءة
                                    setState(() {
                                      showUnread = true;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.report),
                                  title: Text('Spam'),
                                  onTap: () {
                                    // تنفيذ التصفية للرسائل غير الهامة
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.archive),
                                  title: Text('Archived'),
                                  onTap: () {
                                    // تنفيذ التصفية للرسائل المؤرشفة
                                    Navigator.pop(context);
                                  },
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
            SizedBox(height: 20), // تعديل ارتفاع الفاصل
            Expanded( // تعديل الحاوية لتملأ المساحة المتبقية
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Data Ilustration.png"),
                  SizedBox(height: 20), // تعديل ارتفاع الفاصل
                  Image.asset("assets/images/text20.png"),
                ],
              ),
            ),
          ],
        ),
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
  final String avatar;
  final bool hasNotification;

  Message(this.sender, this.message, this.time, this.avatar, this.hasNotification);
}
