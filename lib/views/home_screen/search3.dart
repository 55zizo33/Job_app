import 'package:flutter/material.dart';
import 'package:jobs_app/views/apply_job/apply_job1.dart';
import 'package:jobs_app/views/apply_job/job_detail.dart';
import 'package:jobs_app/views/home_screen/search.dart';
import 'package:jobs_app/views/home_screen/search4.dart';

class Search3View extends StatefulWidget {
  const Search3View({super.key});

  @override
  _Search3ViewState createState() => _Search3ViewState();
}

class _Search3ViewState extends State<Search3View> {
  String selectedJobType = '';

  void selectJobType(String jobType) {
    setState(() {
      selectedJobType = jobType;
    });

    // عرض الفلتر كـ Bottom Sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'On-Site/Remote',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionChip('Remote', selectedJobType == 'Remote'),
                  _buildOptionChip('Onsite', selectedJobType == 'Onsite'),
                  _buildOptionChip('Hybrid', selectedJobType == 'Hybrid'),
                  _buildOptionChip('Any', selectedJobType == 'Any'),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // إغلاق الـ Bottom Sheet
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 12.0),
                  child: Text(
                    'Show result',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffD6E4FF) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? Color(0xff3366FF) : Colors.grey),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Color(0xff3366FF) : Colors.grey,
          fontSize: 14.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Transform.rotate(
          angle: 3.14,
          child: IconButton(
            icon: Icon(Icons.arrow_forward_outlined),
            onPressed: () {
              // رجوع إلى صفحة HomeScreenView
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );
            },
          ),
        ),
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 40,
            width: 291,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                SizedBox(width: 12,),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue,
                    border: Border.all(color: Colors.white), // لون الحدود
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white, // لون خلفية الدائرة
                    child: IconButton(
                      icon: Image.asset("assets/images/close-circle.png"),
                      onPressed: () {
                        // مسح النص في خانة البحث
                        TextEditingController().clear();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0), // المسافة بين الأيقونة والنص
                    child: TextField(
                      controller: TextEditingController(text: "UI/UX Designer"),
                      textAlign: TextAlign.left, // النص يبدأ من اليمين
                      decoration: InputDecoration(
                        hintText: 'Type something...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14), // تعديل المسافة الداخلية
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Icon(Icons.search, color: Colors.grey), // الأيقونة في اليمين
                SizedBox(width: 12), // مسافة عرض 12 بين الأيقونة ونهاية الخانة
              ],
            ),
          ),
        ),
      ),
      body: Stack( // استخدام Stack لعرض محتويات الصفحة والـContainer في نفس الوقت
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // عند الضغط على الأيقونة، انتقل إلى صفحة Search4View
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Search4View()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/setting-4.png', // استخدم المسار الصحيح للأيقونة
                            width: 24, // يمكنك تعديل الحجم كما يناسبك
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            selectJobType('Remote');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedJobType == 'Remote' ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: selectedJobType == 'Remote' ? Colors.blue : Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Remote',
                                  style: TextStyle(color: selectedJobType == 'Remote' ? Colors.white : Colors.grey),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: selectedJobType == 'Remote' ? Colors.white : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            selectJobType('Full Time');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedJobType == 'Full Time' ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: selectedJobType == 'Full Time' ? Colors.blue : Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Full Time',
                                  style: TextStyle(color: selectedJobType == 'Full Time' ? Colors.white : Colors.grey),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: selectedJobType == 'Full Time' ? Colors.white : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            selectJobType('Post date');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedJobType == 'Post date' ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: selectedJobType == 'Post date' ? Colors.blue : Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Post date',
                                  style: TextStyle(color: selectedJobType == 'Post date' ? Colors.white : Colors.grey),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: selectedJobType == 'Post date' ? Colors.white : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 36,
                  color: Color(0xFFE5E7EB),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Featuring 120+ jobs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                JobCard(
                  companyLogo: 'assets/images/Twitter Logo.png',
                  jobTitle: 'UI/UX Designer',
                  companyName: 'Twitter',
                  location: 'Jakarta, Indonesia',
                  salary: '\$10K/Month',
                  jobType1: 'Fulltime',
                  jobType2: 'Remote',
                  selectJobType: selectJobType,
                  selectedJobType: selectedJobType,
                ),
                JobCard(
                  companyLogo: 'assets/images/Spectrum Logo.png',
                  jobTitle: 'UI/UX Designer',
                  companyName: 'Spectrum',
                  location: 'Jakarta, Indonesia',
                  salary: '\$10K/Month',
                  jobType1: 'Fulltime',
                  jobType2: 'Remote',
                  selectJobType: selectJobType,
                  selectedJobType: selectedJobType,
                ),
                JobCard(
                  companyLogo: 'assets/images/VK Logo.png',
                  jobTitle: 'Senior UI Designer',
                  companyName: 'VK',
                  location: 'Yogyakarta, Indonesia',
                  salary: '\$12K/Month',
                  jobType1: 'Fulltime',
                  jobType2: 'Remote',
                  selectJobType: selectJobType,
                  selectedJobType: selectedJobType,
                ),
                JobCard(
                  companyLogo: 'assets/images/Invision Logo.png',
                  jobTitle: 'Junior UI Designer',
                  companyName: 'Invision',
                  location: 'Jakarta, Indonesia',
                  salary: '\$9K/Month',
                  jobType1: 'Part Time',
                  jobType2: 'Remote',
                  selectJobType: selectJobType,
                  selectedJobType: selectedJobType,
                ),
                JobCard(
                  companyLogo: 'assets/images/Behance Logo.png',
                  jobTitle: 'Junior UI Designer',
                  companyName: 'Behance',
                  location: 'Surakarta, Indonesia',
                  salary: '\$12K/Month',
                  jobType1: 'Part Time',
                  jobType2: 'Remote',
                  selectJobType: selectJobType,
                  selectedJobType: selectedJobType,
                ),
              ],
            ),
          ),

          // تم إزالة الـContainer الذي كان يظهر في أسفل الشاشة واستخدام الـBottom Sheet بدلاً من ذلك.
        ],
      ),
    );
  }
}

class JobCard extends StatefulWidget {
  final String companyLogo;
  final String jobTitle;
  final String companyName;
  final String location;
  final String salary;
  final String jobType1;
  final String jobType2;
  final Function(String) selectJobType;
  final String selectedJobType;

  JobCard({
    required this.companyLogo,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.salary,
    required this.jobType1,
    required this.jobType2,
    required this.selectJobType,
    required this.selectedJobType,
  });

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // التنقل إلى صفحة ApplyJobView عند الضغط على JobCard
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobDetailView(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.companyLogo,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.jobTitle,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.companyName} • ${widget.location}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isBookmarked = !isBookmarked;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isBookmarked ? Colors.blue : Colors.transparent,
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.bookmark_border,
                            color: isBookmarked ? Colors.white : Color(0xff111827),
                          ),
                        ),
                      ),
                      Text(
                        widget.salary,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.selectJobType(widget.jobType1);
                    },
                    child: JobTypeChip(
                      label: widget.jobType1,
                      isSelected: widget.selectedJobType == widget.jobType1,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () {
                      widget.selectJobType(widget.jobType2);
                    },
                    child: JobTypeChip(
                      label: widget.jobType2,
                      isSelected: widget.selectedJobType == widget.jobType2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobTypeChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  JobTypeChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffD6E4FF) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? Color(0xff3366FF) : Colors.grey),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Color(0xff3366FF) : Colors.grey,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
