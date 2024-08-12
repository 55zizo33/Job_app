import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/home_screen/search.dart';
import 'package:jobs_app/views/profile_setting/profile.dart';
import 'package:jobs_app/views/saved/empety_state.dart';
import 'package:jobs_app/views/saved/notification.dart';
import 'package:jobs_app/views/messages/message2.dart';
import 'package:jobs_app/views/saved/notification2.dart';

class SaveJob extends StatefulWidget {
  const SaveJob({super.key});

  @override
  _SaveJobState createState() => _SaveJobState();
}

class _SaveJobState extends State<SaveJob> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AppBar(
              title: Text('Saved'),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchView()), // Navigate to EmpetyState
                  );
                },
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  '12 Job Saved',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  jobCard('Twitter', 'Senior UI Designer', 'Jakarta, Indonesia', 'assets/images/Twitter Logo.png'),
                  jobCard('Spectrum', 'UI Designer', 'Jakarta, Indonesia', 'assets/images/Spectrum Logo.png'),
                  jobCard('VK', 'Senior UI Designer', 'Yogyakarta, Indonesia', 'assets/images/VK Logo.png'),
                  jobCard('Discord', 'Senior UX Designer', 'Jakarta, Indonesia', 'assets/images/discord.png'),
                  jobCard('Invision', 'Junior UI Designer', 'Jakarta, Indonesia', 'assets/images/Invision Logo.png'),
                ],
              ),
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
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchView()), // Navigate to Home (SearchView)
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Message2()), // Navigate to Messages (Message2)
              );
            } else if (index == 2) {
              // Navigate to Applied
            } else if (index == 3) {
              // Already on Saved
            } else if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()), // Navigate to Profile
              );
            }
            print('Selected index: $_currentIndex');
          });
        },
      ),
    );
  }

  Widget jobCard(String company, String title, String location, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(imagePath, width: 40, height: 40),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('$company • $location'),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.grey),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey, width: 0.5),
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  'assets/svg/directbox-notif.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                title: Text('Apply Job'),
                                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NotificationView()), // Navigate to NotificationView
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
                                leading: SvgPicture.asset(
                                  'assets/svg/export.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                title: Text('Share via...'),
                                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Notification2()), // Navigate to Notification2
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
                                leading: SvgPicture.asset(
                                  'assets/svg/archive-minus.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                title: Text('Cancel save'),
                                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => EmpetyState()), // Navigate to EmpetyState
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Posted 2 days ago', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 8),
                Align(alignment: Alignment.center, child: Icon(Icons.circle, size: 4, color: Colors.grey)),
                SizedBox(width: 17),
                Icon(Icons.access_time, size: 16, color: Colors.green),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Be an early applicant',
                    style: TextStyle(color: Colors.green),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
