import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int _currentIndex = 4;
  bool isFirstIconPressed = false; // This will track if the first icon is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hi, Rafif Dian',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(width: 4),
                    Text('👋'),
                  ],
                ),
                Text(
                  'Create a better future for yourself here',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFD1D5DB),
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.notifications_none, color: Color(0xFF292D32)),
                  onPressed: () {
                    print('Notifications pressed');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search, color: Color(0xffD1D5DB)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(
                        color: Color(0xFF6200EE),
                        width: 10.0,
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                    print('Search: $value');
                  },
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suggested Job',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('View all pressed');
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(color: Color(0xFF1E88E5), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E3A8A),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/Zoom Logo (2).png', height: 40, width: 40),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product Designer',
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Zoom • United States',
                                    style: TextStyle(color: Colors.white, fontSize: 14)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFirstIconPressed = !isFirstIconPressed;
                              });
                            },
                            child: Image.asset(
                              "assets/images/archive-minus (1).png",
                              color: isFirstIconPressed ? Colors.blue : null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Chip(
                            label: Text('Fulltime'),
                            backgroundColor: Color(0xFF091A7A),
                            labelStyle: TextStyle(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          SizedBox(width: 8),
                          Chip(
                            label: Text('Remote'),
                            backgroundColor: Color(0xFF091A7A),
                            labelStyle: TextStyle(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          SizedBox(width: 8),
                          Chip(
                            label: Text('Design'),
                            backgroundColor: Color(0xFF091A7A),
                            labelStyle: TextStyle(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$12K-15K',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '/Month',
                                  style: TextStyle(color: Color(0xFF848CBC), fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print('Apply now pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff3366FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            child: Text(
                              'Apply now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Job',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('View all pressed');
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(color: Color(0xFF1E88E5), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                jobCard(
                  title: 'Senior UI Designer',
                  company: 'Twitter',
                  location: 'Jakarta, Indonesia',
                  imagePath: 'assets/images/Twitter Logo.png',
                  tags: ['Fulltime', 'Remote', 'Senior'],
                  salary: '\$15K/Month',
                  isFirstIcon: true,
                ),
                jobCard(
                  title: 'Senior UX Designer',
                  company: 'Discord',
                  location: 'Jakarta, Indonesia',
                  imagePath: 'assets/images/discord.png',
                  tags: ['Fulltime', 'Remote', 'Senior'],
                  salary: '\$15K/Month',
                  isFirstIcon: false,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/profile (1).svg',
                  color: _currentIndex == 0 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/archive-minus.svg',
                  color: _currentIndex == 1 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/briefcase.svg',
                  color: _currentIndex == 2 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
              label: 'Applied',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/message.svg',
                  color: _currentIndex == 3 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/home.svg',
                  color: _currentIndex == 4 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
              label: 'Home',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFF3366FF),
          unselectedItemColor: Color(0xFF9CA3AF),
          selectedLabelStyle: TextStyle(color: Color(0xFF3366FF)),
          unselectedLabelStyle: TextStyle(color: Color(0xFF9CA3AF)),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print('Selected index: $_currentIndex');
            });
          },
        ),
      ),
    );
  }

  Widget jobCard({
    required String title,
    required String company,
    required String location,
    required String imagePath,
    required List<String> tags,
    required String salary,
    required bool isFirstIcon,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(imagePath, height: 40, width: 40),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text('$company • $location',
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    "assets/images/archive-minus (1).png",
                    color: isFirstIcon ? (isFirstIconPressed ? Colors.blue : null) : null,
                  ),
                  onPressed: isFirstIcon
                      ? () {
                    setState(() {
                      isFirstIconPressed = !isFirstIconPressed;
                    });
                  }
                      : null,
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (String tag in tags)
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Chip(
                        label: Text(tag),
                        backgroundColor: Color(0xFFD1E7FF),
                        labelStyle: TextStyle(color: Color(0xFF1E88E5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: salary.split('/')[0],
                          style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '/Month',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
