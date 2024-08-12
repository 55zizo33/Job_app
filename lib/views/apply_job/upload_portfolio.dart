import 'package:flutter/material.dart';
import 'package:jobs_app/views/apply_job/apply_job3.dart';
import 'package:jobs_app/views/apply_job/submited.dart';

class UploadPortfolio extends StatelessWidget {
  const UploadPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ApplyJob3View()),
              );
            },
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text(
                'Apply Job',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 130),
              Image.asset(
                'assets/images/Password Succesfully Ilustration.png',
                height: 150, // Adjust the height as needed
              ),
              SizedBox(height: 24),
              Image.asset("assets/images/text4.png"),
              SizedBox(height: 150),
              SizedBox(
                width: 327,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SubmitedView()),
                    );
                  },
                  child: Text('Back to home',style: TextStyle(
                      color:Colors.white,
                      fontSize: 16
                  ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


