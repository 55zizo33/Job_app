import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/home_screen/search.dart';
import 'package:jobs_app/views/messages/message.dart';

class Accepted extends StatefulWidget {
  @override
  _AcceptedState createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  int _currentIndex = 0;
  bool isBookmarkPressed = false;

  @override
  void initState() {
    super.initState();

    // توجيه تلقائي بعد 2 ثانية لصفحة المحادثة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchView()),
            );
          },
        ),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
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
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.notifications_none, color: Color(0xFF292D32)),
                  onPressed: () {
                    print('Notifications pressed');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Color(0xFF6200EE),
                        width: 2.0,
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                    print('Search: $value');
                  },
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFD6E4FF),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Twitter Logo.png', height: 40, width: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Twitter', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('Waiting to be selected by the twitter team'),
                          ],
                        ),
                      ),
                      Container(
                        width: 74,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFB2ED82),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text('Accepted', style: TextStyle(color: Color(0xFF1E88E5)))),
                      ),
                    ],
                  ),
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
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E3A8A),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/Zoom Logo (2).png', height: 40, width: 40),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product Designer', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                Text('Zoom • United States', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(isBookmarkPressed ? Icons.bookmark : Icons.bookmark_border, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                isBookmarkPressed = !isBookmarkPressed;
                              });
                              print('Bookmark pressed');
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          Container(
                            width: 65,
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF3B82F6),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            child: Text('Fulltime', style: TextStyle(color: Colors.white)),
                          ),
                          Container(
                            width: 65,
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF3B82F6),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            child: Text('Remote', style: TextStyle(color: Colors.white)),
                          ),
                          Container(
                            width: 65,
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF3B82F6),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            child: Text('Senior', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$12K-15K/Month', style: TextStyle(color: Colors.white, fontSize: 18)),
                          SizedBox(
                            width: 120,
                            height: 32,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              onPressed: () {  },
                              child: Center(
                                child: Text('Apply now', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/home.svg',
                color: _currentIndex == 0 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/message.svg',
                color: _currentIndex == 1 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/briefcase.svg',
                color: _currentIndex == 2 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/archive-minus.svg',
                color: _currentIndex == 3 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/profile (1).svg',
                color: _currentIndex == 4 ? Color(0xFF3366FF) : Color(0xFF9CA3AF)),
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

  Widget jobCard({
    required String title,
    required String company,
    required String location,
    required String imagePath,
    required List<String> tags,
    required String salary,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(imagePath, height: 40, width: 40),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('$company • $location'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: tags.map((tag) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(
                  label: Text(tag),
                  backgroundColor: Color(0xFFD1E7FF),
                  labelStyle: TextStyle(color: Color(0xFF1E88E5)),
                ),
              )).toList(),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(salary, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5))),
                IconButton(
                  icon: Icon(isBookmarkPressed ? Icons.bookmark : Icons.bookmark_border, color: Color(0xFF1E88E5)),
                  onPressed: () {
                    setState(() {
                      isBookmarkPressed = !isBookmarkPressed;
                    });
                    print('Bookmark pressed');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
