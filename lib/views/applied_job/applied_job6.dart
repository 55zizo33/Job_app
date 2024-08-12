import 'package:flutter/material.dart';
import 'package:jobs_app/views/applied_job/applied_job5.dart';
import 'package:jobs_app/views/applied_job/applied_job7.dart';

class AppliedJob6 extends StatefulWidget {
  const AppliedJob6({super.key});

  @override
  _AppliedJob6State createState() => _AppliedJob6State();
}

class _AppliedJob6State extends State<AppliedJob6> {
  int selectedJobOptionIndex = -1; // Index of the selected job option

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
              MaterialPageRoute(builder: (context) => AppliedJob5()),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Image.asset("assets/images/Spectrum Logo.png"),
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text(
                    'UI/UX Designer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Discord • Jakarta, Indonesia',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  stepContainer('1', 'Biodata', true, Colors.blue),
                  Text('-----', style: TextStyle(color: Colors.blue)),
                  stepContainer('2', 'Type of work', true, Colors.blue),
                  Text('-----', style: TextStyle(color: Colors.grey)),
                  stepContainer('3', 'Upload portfolio', false, Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Type of work',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 4,),
            Text(
              'Fill in your bio data correctly',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 28),
            jobOption(0, 'Senior UX Designer', 'CV.pdf • Portfolio.pdf'),
            SizedBox(height: 10,),
            jobOption(1, 'Senior UI Designer', 'CV.pdf • Portfolio.pdf'),
            SizedBox(height: 10,),
            jobOption(2, 'Graphik Designer', 'CV.pdf • Portfolio.pdf'),
            SizedBox(height: 10,),
            jobOption(3, 'Front-End Developer', 'CV.pdf • Portfolio.pdf'),
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 327,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApplyJob7View()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepContainer(String stepNumber, String label, bool isActive, Color color) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          child: Center(
            child: isActive
                ? Icon(Icons.check, color: Colors.white)
                : Text(
              stepNumber,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget jobOption(int index, String title, String subtitle) {
    bool isSelected = selectedJobOptionIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedJobOptionIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[50] : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey[300]!),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          trailing: isSelected
              ? Icon(Icons.radio_button_checked, color: Colors.blue)
              : Icon(Icons.radio_button_off, color: Colors.grey),
        ),
      ),
    );
  }
}
