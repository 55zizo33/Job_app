import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/applied_job/applied_job4.dart';
import 'package:jobs_app/views/applied_job/applied_job6.dart';

class AppliedJob5 extends StatefulWidget {
  const AppliedJob5({super.key});

  @override
  _AppliedJob5State createState() => _AppliedJob5State();
}

class _AppliedJob5State extends State<AppliedJob5> {
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _typeOfWorkFocusNode = FocusNode(); // إضافة FocusNode للخانة 2

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _typeOfWorkFocusNode.dispose();
    super.dispose();
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AppliedJob4()),
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
                    'Spectrum • Jakarta, Indonesia',
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
                border: Border.all(color: Colors.white!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  stepContainer('1', 'Biodata', true),
                  Text('-----', style: TextStyle(color: Colors.blue)),
                  stepContainer('2', 'Type of work', _typeOfWorkFocusNode.hasFocus), // ربط التظليل بحالة التركيز
                  Text('-----', style: TextStyle(color: Colors.grey)),
                  stepContainer('3', 'Upload portfolio', false),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Biodata',
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
            SizedBox(height: 24),
            TextFormField(
              focusNode: _fullNameFocusNode,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(color: _fullNameFocusNode.hasFocus ? Colors.blue : Colors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/svg/frame.svg",
                    color: _fullNameFocusNode.hasFocus ? Colors.blue : Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: _fullNameFocusNode.hasFocus ? Colors.blue : Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              onTap: () {
                setState(() {
                  FocusScope.of(context).requestFocus(_fullNameFocusNode);
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              focusNode: _emailFocusNode,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: _emailFocusNode.hasFocus ? Colors.blue : Colors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/svg/sms.svg",
                    color: _emailFocusNode.hasFocus ? Colors.blue : Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: _emailFocusNode.hasFocus ? Colors.blue : Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              onTap: () {
                setState(() {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              focusNode: _phoneFocusNode,
              decoration: InputDecoration(
                labelText: 'No.Handphone',
                labelStyle: TextStyle(color: _phoneFocusNode.hasFocus ? Colors.blue : Colors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/FLAG (2).png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8), // مساحة بين العلم والأيقونة
                      Icon(Icons.expand_more, color: _phoneFocusNode.hasFocus ? Colors.blue : Colors.grey),
                    ],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: _phoneFocusNode.hasFocus ? Colors.blue : Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              onTap: () {
                setState(() {
                  FocusScope.of(context).requestFocus(_phoneFocusNode);
                });
              },
            ),
            SizedBox(height: 50),
            Center(
              child: SizedBox(
                width: 327,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppliedJob6()), // Navigate to AppliedJob6
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0), // نصف الارتفاع لجعل الزر بيضاوي
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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

  Widget stepContainer(String stepNumber, String label, bool isActive) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: isActive ? Colors.blue : Colors.grey[50],
          child: Text(
            stepNumber,
            style: TextStyle(
              color: isActive ? Colors.white : Color(0xFF9CA3AF),
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
