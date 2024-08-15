import 'package:flutter/material.dart';
import 'package:jobs_app/views/applied_job/applied_job8.dart';
import 'package:jobs_app/views/complete_profil/personal_details.dart';
import 'package:jobs_app/views/complete_profil/education.dart';
import 'package:jobs_app/views/complete_profil/experience.dart';
import 'package:jobs_app/views/profile_setting/portfolio.dart';
import 'package:jobs_app/views/profile_setting/profile.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  double completionPercentage = 0.0;
  int completedSteps = 0;

  void _incrementCompletion() {
    setState(() {
      completedSteps++;
      completionPercentage = (completedSteps / 4) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
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
                      value: completionPercentage / 100,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Text(
                    '${completionPercentage.toInt()}%',
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
            Text(
              '${(completionPercentage / 100 * 4).toInt()}/4 Completed',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
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
                    onTap: () {
                      _incrementCompletion();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonalDetails()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  ProfileStep(
                    title: 'Education',
                    subtitle: 'Enter your educational history to be considered by the recruiter',
                    onTap: () {
                      _incrementCompletion();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Education()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  ProfileStep(
                    title: 'Experience',
                    subtitle: 'Enter your work experience to be considered by the recruiter',
                    onTap: () {
                      _incrementCompletion();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Experience()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  ProfileStep(
                    title: 'Portfolio',
                    subtitle: 'Create your portfolio. Applying for various types of jobs is easier.',
                    onTap: () {
                      _incrementCompletion();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Portfolio()),
                      );
                    },
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

class ProfileStep extends StatefulWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ProfileStep({
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  _ProfileStepState createState() => _ProfileStepState();
}

class _ProfileStepState extends State<ProfileStep> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = true;
        });
        widget.onTap?.call();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isPressed ? Color(0xFF84A9FF) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: isPressed ? Colors.blue : Colors.grey,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Icon(
                Icons.arrow_forward,
                color: isPressed ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
