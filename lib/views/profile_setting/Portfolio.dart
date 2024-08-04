import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:jobs_app/views/profile_setting/profile.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
        title: Text('Portfolio'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Add portfolio here',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            DottedBorder(
              color: const Color(0xFF1E90FF), // لون الأزرق الزاهي
              strokeWidth: 3.0, // زيادة عرض الحدود لجعلها أكثر بروزًا
              radius: Radius.circular(8.r),
              padding: EdgeInsets.all(0), // إزالة الحشوة داخل DottedBorder
              dashPattern: [6, 3], // تعريف نمط الخطوط المتقطعة
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r), // تحديد الزوايا الدائرية
                child: Container(
                  color: Color(0xFFECF2FF), // لون الخلفية
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFD6E4FF),
                        child: SvgPicture.asset("assets/svg/document-upload.svg"),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Upload your other file',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Max. file size 10 MB',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 295.w,
                        height: 50.h,
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles();
                            if (result != null) {
                              PlatformFile file = result.files.first;
                              print('File Name: ${file.name}');
                              print('File Size: ${file.size}');
                              print('File Path: ${file.path}');
                            } else {
                              // User canceled the picker
                            }
                          },
                          icon: SvgPicture.asset("assets/svg/export.svg", color: Colors.blue),
                          label: Text('Add file', style: TextStyle(color: Colors.blue)),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView(
                children: [
                  _buildPortfolioItem('UI/UX Designer', 'CV.pdf 300KB'),
                  _buildPortfolioItem('3D Designer', 'CV.pdf 300KB'),
                  _buildPortfolioItem('Graphic Designer', 'CV.pdf 300KB'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioItem(String title, String subtitle) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Color(0xffD1D5DB), width: 2.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/svg/Vector.svg",
            width: 40.w,
            height: 40.h,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.h),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: SvgPicture.asset("assets/svg/edit-2.svg"),
            onPressed: () {
              // Add edit functionality here
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/svg/close-circle.svg"),
            onPressed: () {
              // Add delete functionality here
            },
          ),
        ],
      ),
    );
  }
}


