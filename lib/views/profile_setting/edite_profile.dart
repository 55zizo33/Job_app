import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_app/views/profile_setting/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

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
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: _imageFile == null
                        ? AssetImage("assets/images/Profile (1).png") as ImageProvider
                        : FileImage(File(_imageFile!.path)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 40.r,
                        width: 40.r,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffD1D5DB), width: 2.0), // تغيير لون الحدود هنا
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              style: ButtonStyle(),
              onPressed: _pickImage,
              child: Text(
                'Change Photo',
                style: TextStyle(color: Colors.blue, fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 20.h),
            _buildTextField('Name', 'Rafif Dian Axelmega'),
            SizedBox(height: 10.h),
            _buildTextField('Bio', 'Senior UI/UX Designer'),
            SizedBox(height: 10.h),
            _buildTextField('Address', 'Ranjingan, Wangon, Washington City'),
            SizedBox(height: 10.h),
            _buildPhoneNumberField(),
            SizedBox(height: 70.h),
            ElevatedButton(
              onPressed: () {
                // Add the save functionality here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 145.w),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r), // تغيير الشكل إلى بيضاوي
                ),
              ),
              child: Align(alignment: Alignment.topCenter,
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xffD1D5DB), width: 2.0), // تغيير لون الحدود هنا
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'No.Handphone',
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xffD1D5DB), width: 2.0), // تغيير لون الحدود هنا
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Color(0xffD1D5DB), width: 2.0), // إضافة خط عمودي فاصل
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/FLAG (1).png", // استخدام الصورة المحددة
                      width: 40.w,
                      height: 40.h,
                    ),
                    SizedBox(width: 8.w),
                    Image.asset("assets/images/arrow-down.png", width: 16.w, height: 16.h),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '0100-666-7234',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
