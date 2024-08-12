import 'package:flutter/material.dart';
import 'package:jobs_app/views/apply_job/apply_job1.dart';

class JobDetailView extends StatefulWidget {
  @override
  _JobDetailViewState createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Job Detail"),
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/images/archive-minus.png'),
              color: Color(0xff3366FF),
            ),
            onPressed: () {
              // Bookmark action
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Twitter Logo.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Senior UI Designer',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Twitter • Jakarta, Indonesia',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildOvalLabel('Fulltime'),
                      SizedBox(width: 8),
                      _buildOvalLabel('Onsite'),
                      SizedBox(width: 8),
                      _buildOvalLabel('Senior'),
                    ],
                  ),
                ],
              ),
            ),
            // Tab Bar
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTabButton('Description', 0),
                  _buildTabButton('Company', 1),
                  _buildTabButton('People', 2),
                ],
              ),
            ),
            // Tab Bar Views
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  _selectedIndex == 0 ? _buildDescriptionTab() : Container(),
                  _selectedIndex == 1 ? _buildCompanyTab() : Container(),
                  _selectedIndex == 2 ? _buildPeopleTab() : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff3366FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ApplyJobView()),
            );
          },
          child: Text(
            'Apply now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOvalLabel(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xffE0ECFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xff3366FF),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Color(0xff02337A) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            'Job Description',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/icons, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will work with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Skill Required',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '• A strong visual portfolio with clear understanding of UI methodologies\n• Ability to create high-fidelity mock-ups in Figma\n• Ability to create various graphics for the web e.g. illustrations and icons\n• Able to facilitate workshops and liaise with stakeholders\n• Proficiency in the Adobe Creative Suite\n• 5+ years of commercial experience in a similar position',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('twitter@mail.com'),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Website',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('https://twitter.com'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'About Company',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire. We also have a US office in Boston, Massachusetts specializing in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence. We recently celebrated our first decade in business and over the years have been recognized with several industry awards including "Best Staffing Firm to Work For 2018" at the SIA Awards for the third consecutive year and "Business of the Year 2017" at the SME Hertfordshire Business Awards. Our teams of specialists operate across all areas of Technology and Digital including Java, Python, .NET, JavaScript, Artificial Intelligence & Machine Learning, DevOps & Cloud, and more.',
          ),
        ],
      ),
    );
  }

  Widget _buildPeopleTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '6 Employees For',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'UI/UX Design',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: <String>['UI/UX Designer', 'Developer', 'Project Manager']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    value: 'UI/UX Designer',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildEmployeeCard('Dimas Adi Saputro', 'Senior UI/UX Designer at Twitter', '5 Years', 'assets/images/Dimas Profile.png'),
          _buildEmployeeCard('Syahrul Ramadhani', 'Senior UI/UX Designer at Twitter', '5 Years', 'assets/images/Syahrul Profile.png'),
          _buildEmployeeCard('Farrel Daniswara', 'Senior UI/UX Designer at Twitter', '4 Years', 'assets/images/Farrel Profile.png'),
          _buildEmployeeCard('Azzahra Farrelika', 'UI/UX Designer at Twitter', '4 Years', 'assets/images/Azzahra Profile.png'),
          _buildEmployeeCard('Dindra Despinian', 'UI/UX Designer at Twitter', '4 Years', 'assets/images/Azzahra Profile.png'),
        ],
      ),
    );
  }

  Widget _buildEmployeeCard(String name, String position, String duration, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 24,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(position),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Work during', style: TextStyle(color: Colors.grey)),
              Text(duration, style: TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }
}


