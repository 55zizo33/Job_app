import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_app/views/applied_job/applied_job7.dart';

class AppliedJob8 extends StatelessWidget {
  const AppliedJob8({super.key});

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
              MaterialPageRoute(builder: (context) => ApplyJob7View()),
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
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF4F4F5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          'Active',
                          style: TextStyle(
                            color: Color(0xff6B7280),
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
                          color: Color(0xffFFFFFF),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 87,),
            Image.asset("assets/images/Data Ilustration (1).png"),
            SizedBox(height: 24,),
            Text("No applications were rejected",style: TextStyle(
              fontSize: 24,fontWeight: FontWeight.w500
            ),),
            SizedBox(height:12 ,),

            Padding(
              padding: const EdgeInsets.only(left: 26,right: 25),
              child: Text("If there is an application that is rejected by the company it will appear here",
                style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w500
                ),
              ),
            )

          ],
        ),
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
}
