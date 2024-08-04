import 'package:flutter/material.dart';
import 'package:jobs_app/views/applied_job/applied_job8.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AppliedJob8()),
              );
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black),
        titleSpacing: 50,
        title: Text('Complete Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Text(
                    '50%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text('2/4 Completed'),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Text(
                'Complete your profile before applying for a job',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  ProfileStep(
                    title: 'Personal Details',
                    subtitle: 'Full name, email, phone number, and your address',
                    isCompleted: true,
                    color: Color(0xFF84A9FF).withOpacity(.4),
                  ),
                  SizedBox(height: 20,),
                  ProfileStep(
                    title: 'Education',
                    subtitle: 'Enter your educational history to be considered by the recruiter',
                    isCompleted: true,
                    color: Color(0xFF84A9FF).withOpacity(.4),
                  ),
                  SizedBox(height: 20,),
                  ProfileStep(
                    title: 'Experience',
                    subtitle: 'Enter your work experience to be considered by the recruiter',
                    isCompleted: false,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20,),
                  ProfileStep(
                    title: 'Portfolio',
                    subtitle: 'Create your portfolio. Applying for various types of jobs is easier.',
                    isCompleted: false,
                    color: Colors.white,
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

class ProfileStep extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final Color color;

  const ProfileStep({
    required this.title,
    required this.subtitle,
    required this.isCompleted,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: isCompleted ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

