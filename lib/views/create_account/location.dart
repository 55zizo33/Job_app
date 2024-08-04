import 'package:flutter/material.dart';
import 'package:jobs_app/views/create_account/set_up.dart';

class LocationView extends StatefulWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  String selectedWorkType = 'Remote Work';
  String selectedCountry = '';

  void selectWorkType(String workType) {
    setState(() {
      selectedWorkType = workType;
    });
  }

  void selectCountry(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

  Widget buildCountryButton(String title, String imagePath, double width, double height) {
    bool isSelected = selectedCountry == title;
    return GestureDetector(
      onTap: () => selectCountry(title),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFDCE7FF) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? const Color(0xFF3366FF) : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(width: 8),
            Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF3366FF) : Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 20),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Image.asset("assets/images/Tittle (6).png"),
              ),
              const SizedBox(height: 8),
              const Text(
                "Let us know, where is the work location you want at this time, so we can adjust it.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => selectWorkType('Work From Office'),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedWorkType == 'Work From Office' ? const Color(0xFF091A7A) : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              child: Text(
                                'Work From Office',
                                style: TextStyle(
                                  color: selectedWorkType == 'Work From Office' ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => selectWorkType('Remote Work'),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedWorkType == 'Remote Work' ? const Color(0xFF091A7A) : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              child: Text(
                                'Remote Work',
                                style: TextStyle(
                                  color: selectedWorkType == 'Remote Work' ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select the country you want for your job",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      buildCountryButton('United States', 'assets/images/Ellipse 804 (13).png', 90, 42),
                      buildCountryButton('Malaysia', 'assets/images/Ellipse 804 (14).png', 90, 42),
                      buildCountryButton('Singapore', 'assets/images/Ellipse 804 (15).png', 90, 42),
                      buildCountryButton('Indonesia', 'assets/images/Ellipse 804 (16).png', 90, 42),
                      buildCountryButton('Philippines', 'assets/images/Ellipse 804 (17).png', 90, 42),
                      buildCountryButton('Poland', 'assets/images/Ellipse 804 (19).png', 90, 42),
                      buildCountryButton('India', 'assets/images/Ellipse 804 (20).png', 90, 42),
                      buildCountryButton('Vietnam', 'assets/images/Ellipse 804 (21).png', 90, 42),
                      buildCountryButton('China', 'assets/images/Ellipse 804 (22).png', 90, 42),
                      buildCountryButton('Canada', 'assets/images/Ellipse 804 (23).png', 90, 42),
                      buildCountryButton('Saudi Arabia', 'assets/images/Ellipse 804 (24).png', 90, 42),
                      buildCountryButton('Argentina', 'assets/images/Ellipse 804 (25).png', 90, 42),
                      buildCountryButton('Brazil', 'assets/images/Ellipse 804 (26).png', 90, 42),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: selectedCountry.isNotEmpty
                        ? () {
                      // الانتقال إلى صفحة SetUpView عند الضغط على الزر
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SetUpView()),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCountry.isNotEmpty ? Colors.blue : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Next', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
