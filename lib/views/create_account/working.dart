import 'package:flutter/material.dart';
import 'package:jobs_app/views/create_account/location.dart';

class WorkingView extends StatefulWidget {
  @override
  _WorkingViewState createState() => _WorkingViewState();
}

class _WorkingViewState extends State<WorkingView> {
  String selectedWorkType = '';

  void selectWorkType(String workType) {
    setState(() {
      selectedWorkType = workType;
    });
  }

  Widget buildWorkTypeCard(String title, String imagePath) {
    bool isSelected = selectedWorkType == title;
    Color backgroundColor;
    Color borderColor;

    if (title == 'UI/UX Designer' || title == 'Research and Analytics') {
      backgroundColor = Color(0xFFD6E4FF);
      borderColor = Color(0xFF3366FF);
    } else {
      backgroundColor = isSelected ? Color(0xFFDCE7FF) : Colors.white;
      borderColor = isSelected ? Color(0xFF3366FF) : Colors.grey.shade300;
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => selectWorkType(title),
        child: Container(
          width: 154,
          height: 156,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 50, width: 50),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Color(0xFF3366FF) : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Image.asset("assets/images/image1.png"),
              ),
              SizedBox(height: 36),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWorkTypeCard('Illustrator Designer', 'assets/images/Ilustrator Designer.png'),
                      buildWorkTypeCard('UI/UX Designer', 'assets/images/UX Design.png'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWorkTypeCard('Management', 'assets/images/Management.png'),
                      buildWorkTypeCard('Developer', 'assets/images/Developer.png'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWorkTypeCard('Research and Analytics', 'assets/images/Research and Analytics.png'),
                      buildWorkTypeCard('Information Technology', 'assets/images/Information Technologi.png'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: selectedWorkType.isNotEmpty ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationView()),
                      );
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedWorkType.isNotEmpty ? Colors.blue : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Next', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
