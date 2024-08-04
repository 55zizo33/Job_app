import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/profile_setting/privacy_policy.dart';

class AppliedJob4 extends StatelessWidget {
  const AppliedJob4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PrivacyPolicy()),
            );
          },
        ),
        title: Text(
          'Applied Job',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          'Active',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Rejected',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 24,),
          Container(
            color: Color(0xFFE5E7EB),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Center(
              child: Align(alignment:Alignment.centerLeft ,
                child: Padding(
                  padding: EdgeInsets.only(left:24 ),
                  child: Text(
                    '3 Jobs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                jobCard(
                  context,
                  'UI/UX Designer',
                  'Spectrum + Jakarta, Indonesia',
                  'assets/images/Spectrum Logo.png',
                  'Fulltime',
                  'Remote',
                  'Posted 2 days ago',
                  isFirst: true,
                ),
                jobCard(
                  context,
                  'UI/UX Designer',
                  'Discord + Jakarta, Indonesia',
                  'assets/images/discord.png',
                  'Fulltime',
                  'Remote',
                  'Posted 2 days ago',
                  isFirst: false,
                ),
                jobCard(
                  context,
                  'UI/UX Designer',
                  'InVision + Jakarta, Indonesia',
                  'assets/images/Invision Logo.png',
                  'Fulltime',
                  'Remote',
                  'Posted 2 days ago',
                  isFirst: false,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/home (3).svg',
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/home (3).svg',
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/message.svg',
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/message.svg',
              color: Colors.blue,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/briefcase.svg',
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/briefcase.svg',
              color: Colors.blue,
            ),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/archive-minus.svg',
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/archive-minus.svg',
              color: Colors.blue,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/profile (1).svg',
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/profile (1).svg',
              color: Colors.blue,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Change this to set the default selected item
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget jobCard(BuildContext context, String title, String company, String logoPath, String jobType, String workType, String postDate, {bool isFirst = false}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset(logoPath, width: 40, height: 40),
              title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(company),
              trailing: SvgPicture.asset(
                "assets/svg/archive-minus.svg",
                color: isFirst ? Colors.blue : Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                jobDetailChip(jobType),
                jobDetailChip(workType),
                Text(postDate),
              ],
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  stepContainer('1', 'Biodata', true),
                  Text('-----', style: TextStyle(color: Colors.grey)),
                  stepContainer('2', 'Type of work', isFirst),
                  Text('-----', style: TextStyle(color: Colors.grey)),
                  stepContainer('3', 'Upload portfolio', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget jobDetailChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget stepContainer(String stepNumber, String label, bool isActive) {
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: isActive ? Color(0xff3366FF) : Colors.grey[300],
          child: Text(
            stepNumber,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}


