import 'package:flutter/material.dart';
import 'package:jobs_app/views/apply_job/apply_job1.dart';

class ApplyJob2View extends StatefulWidget {
  const ApplyJob2View({super.key});

  @override
  _ApplyJob2ViewState createState() => _ApplyJob2ViewState();
}

class _ApplyJob2ViewState extends State<ApplyJob2View> {
  int _currentStep = 1;
  String? _selectedJob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ApplyJobView()),
            );
          },
        ),
        title: Text('Apply Job'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepIcon(0, '1', 'Biodata'),
                _buildStepLine(),
                _buildStepIcon(1, '2', 'Type of work'),
                _buildStepLine(),
                _buildStepIcon(2, '3', 'Upload portfolio'),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Type of work',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Fill in your bio data correctly',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildJobOption('Senior UX Designer'),
                  _buildJobOption('Senior UI Designer'),
                  _buildJobOption('Graphik Designer'),
                  _buildJobOption('Front-End Developer'),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: _selectedJob != null
                  ? () {
                setState(() {
                  if (_currentStep < 2) {
                    _currentStep += 1;
                  } else {
                    // Apply Now action
                  }
                });
              }
                  : null,
              child: Center(
                  child: Text('Next', style: TextStyle(fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIcon(int step, String number, String title) {
    bool isActive = _currentStep == step;
    bool isCompleted = step < _currentStep;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2), // Border width
          decoration: BoxDecoration(
            color: isCompleted ? Colors.blue : Colors.white, // Background color
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? Colors.blue : Colors.grey,
              width: 2.0,
            ),
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: isCompleted ? Colors.blue : Colors.white,
            child: isCompleted
                ? Icon(
              Icons.check,
              color: Colors.white,
            )
                : Text(
              number,
              style: TextStyle(
                color: isActive ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isActive || isCompleted ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine() {
    return Expanded(
      child: Divider(
        color: Colors.grey,
        thickness: 1,
        endIndent: 8,
        indent: 8,
      ),
    );
  }

  Widget _buildJobOption(String jobTitle) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey),
      ),
      child: RadioListTile<String>(
        value: jobTitle,
        groupValue: _selectedJob,
        onChanged: (String? value) {
          setState(() {
            _selectedJob = value;
          });
        },
        title: Text(jobTitle),
        subtitle: Row(
          children: [
            Text('CV.pdf'),
            SizedBox(width: 8),
            Text('Portfolio.pdf'),
          ],
        ),
        controlAffinity: ListTileControlAffinity.trailing, // Move the radio button to the right
      ),
    );
  }
}

