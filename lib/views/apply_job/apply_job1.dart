import 'package:flutter/material.dart';
import 'package:jobs_app/views/apply_job/apply_job2.dart';
import 'package:jobs_app/views/apply_job/job_detail.dart';

class ApplyJobView extends StatefulWidget {
  const ApplyJobView({super.key});

  @override
  _ApplyJobViewState createState() => _ApplyJobViewState();
}

class _ApplyJobViewState extends State<ApplyJobView> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => JobDetailView()),
            );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55.0),
          child: Text('Apply Job'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 34), // Add space of 34 between AppBar and body
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepIcon(0, '1', 'Biodata'),
                _buildStepLine(),
                _buildStepIcon(1, '2', 'Type of work'),
                _buildStepLine(),
                _buildStepIcon(2, '3', 'Upload portfolio'),
              ],
            ),
          ),
          Expanded(
            child: _buildStepContent(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            setState(() {
              if (_currentStep < 2) {
                _currentStep += 1;
                if (_currentStep == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplyJob2View()),
                  );
                }
              } else {
                // Apply Now action
              }
            });
          },
          child: Text('Next', style: TextStyle(fontSize: 16,
              color: Colors.white
          )),
        ),
      ),
    );
  }

  Widget _buildStepIcon(int step, String number, String title) {
    bool isActive = _currentStep == step;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2), // Border width
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.white, // Background color
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? Colors.blue : Colors.grey,
              width: 2.0,
            ),
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: isActive ? Colors.blue : Colors.white,
            child: isActive
                ? Icon(
              Icons.check,
              color: Colors.white,
            )
                : Text(
              number,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
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

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildBiodataForm();
      case 1:
        return Center(child: Text('Type of work content'));
      case 2:
        return Center(child: Text('Upload portfolio content'));
      default:
        return Container();
    }
  }

  Widget _buildBiodataForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Biodata',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Fill in your bio data correctly',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          _buildInputField('Full Name*', 'assets/images/profile.png', 'Rafif Dian Axelingga'),
          SizedBox(height: 16),
          _buildInputField('Email*', 'assets/images/sms.png', 'rafifdian12@gmail.com'),
          SizedBox(height: 16),
          _buildInputField('No.Handphone*', 'assets/images/FLAG.png', '0100-666-7234', isPhone: true),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String iconPath, String initialValue, {bool isPhone = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(iconPath, width: 24),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
