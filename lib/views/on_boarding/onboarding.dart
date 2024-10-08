import 'package:flutter/material.dart';
import 'package:jobs_app/views/on_boarding/onboarding2.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'J BSQUE',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Center(
                  child: Image.asset('assets/images/Background.png'),
                ),
                SizedBox(height: 24),
                Center(
                  child: Image.asset('assets/images/Tittle.png'),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Find a job, and ',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'start building', style: TextStyle(color: Colors.blue)),
                      TextSpan(text: ' your career from now on'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore over 25,924 available job roles and upgrade your operator now.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8, // تكبير حجم الدائرة الزرقاء
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Color(0xff3366FF), // تغيير لون الدائرة للأزرق
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        width: 6,
                        height: 6,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Color(0xffADC8FF), // الدائرة الثانية تظل كما هي
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        width: 6,
                        height: 6,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Color(0xffADC8FF), // الدائرة الثالثة تظل كما هي
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding2View()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24), // تعديل شكل الزرار للبيضاوي
                      ),
                      minimumSize: Size(327, 48), // تحديد العرض والارتفاع
                    ),
                    child: Text('Next', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
