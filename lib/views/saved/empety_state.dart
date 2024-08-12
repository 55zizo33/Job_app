import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_app/views/saved/save_job.dart';

class EmpetyState extends StatefulWidget {
  const EmpetyState({super.key});

  @override
  State<EmpetyState> createState() => _EmpetyStateState();
}

class _EmpetyStateState extends State<EmpetyState> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SaveJob()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 165,),
            Image.asset("assets/images/Saved Ilustration.png"),
            SizedBox(height: 24,),
            Image.asset("assets/images/text11.png")
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
            if (index == 0) {
              // Navigate to Home
            } else if (index == 1) {
              // Navigate to Messages
            } else if (index == 2) {
              // Navigate to Applied
            } else if (index == 3) {
              // Already on Saved
            } else if (index == 4) {
              // Navigate to Profile
            }
          });
        },
      ),
    );
  }
}
