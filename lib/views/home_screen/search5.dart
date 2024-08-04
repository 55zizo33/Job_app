import 'package:flutter/material.dart';
import 'package:jobs_app/views/home_screen/search3.dart';

class Search5View extends StatefulWidget {
  const Search5View({super.key});

  @override
  _Search5ViewState createState() => _Search5ViewState();
}

class _Search5ViewState extends State<Search5View> {
  String selectedJobType = '';

  void selectJobType(String jobType) {
    setState(() {
      selectedJobType = jobType;
    });
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
              // رجوع إلى صفحة HomeScreen2View
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Search3View()),
              );
            },
          ),
        ),
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 48,
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
                    border: Border.all(color: Color(0xff111827)), // لون الحدود
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white, // لون خلفية الدائرة
                    radius: 13, // تغيير عرض CircleAvatar إلى 7
                    child: IconButton(
                      icon: Icon(Icons.close, color: Color(0xff111827), size: 12), // تغيير حجم الأيقونة لتتناسب مع الحجم الجديد
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
      body: Padding(
        padding: const EdgeInsets.only(top: 22.0), // مسافة 22 ارتفاع بين الـ AppBar والجسم
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0), // مسافة عرض 24 بين الصورة وأخرى الشاشة
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Filter icon tapped')),
                        );
                      },
                      child: Image.asset(
                        'assets/images/setting-4.png',
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
                          color: selectedJobType == 'Remote' ? Color(0XFF091A7A) : Colors.white,
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
                          color: selectedJobType == 'Full Time' ? Color(0XFF091A7A) : Colors.white,
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
            SizedBox(height: 99),
            Column(
              children: [
                Image.asset(
                  'assets/images/home.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 10),
             Image.asset("assets/images/title 10.png")
              ],
            ),
          ],
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


