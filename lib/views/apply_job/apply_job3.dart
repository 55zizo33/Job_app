import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart'; // استيراد مكتبة dotted_border

class ApplyJob3View extends StatefulWidget {
  const ApplyJob3View({super.key});

  @override
  _ApplyJob3ViewState createState() => _ApplyJob3ViewState();
}

class _ApplyJob3ViewState extends State<ApplyJob3View> {
  String? _uploadedFileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _uploadedFileName = result.files.single.name;
      });
    }
  }

  Widget _buildStepIcon(int step, String title, {required bool isCompleted, required bool isActive}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2), // Border width
          decoration: BoxDecoration(
            color: isCompleted ? Colors.blue : Colors.white, // Background color
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? Colors.blue : Colors.grey,
              width: 2.0,
            ),
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: isCompleted ? Colors.blue : Colors.white,
            child: isCompleted
                ? Icon(
              Icons.check,
              color: Colors.white,
            )
                : Text(
              (step + 1).toString(),
              style: TextStyle(
                color: isActive ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isActive || isCompleted ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine({required bool isActive}) {
    return Expanded(
      child: Divider(
        color: isActive ? Colors.blue : Colors.grey,
        thickness: 1,
        endIndent: 8,
        indent: 8,
      ),
    );
  }

  Widget _buildUploadSection(String label, String fileName, String fileSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: _pickFile, // عند النقر على صورة PDF، يفتح متصفح الملفات
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/Vector (2).png', width: 24, height: 24), // تأكد من وجود الأيقونة في المسار الصحيح
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fileName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        fileSize,
                        style: TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Image.asset('assets/images/edit-2.png'),
                  iconSize: 24,
                  onPressed: _pickFile,
                ),
                IconButton(
                  icon: Image.asset('assets/images/close-circle.png'),
                  iconSize: 24,
                  onPressed: () {
                    // Handle delete action
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOtherFileUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other File',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12),
        DottedBorder(
          color: Colors.blue, // لون الحدود الزرقاء
          strokeWidth: 2.0, // عرض الحدود
          dashPattern: [5, 5], // نمط الخطوط المتقطعة
          borderType: BorderType.RRect,
          radius: Radius.circular(8),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24),
            color: Color(0xffECF2FF), // اللون الداخلي للكونتينر
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  child: Image.asset('assets/images/document-upload.png', width: 48, height: 48), // استخدام الصورة الجديدة داخل CircleAvatar
                ),
                SizedBox(height: 8),
                Text('Upload your other file', style: TextStyle(color: Color(0xff111827),
                    fontSize: 18,fontWeight: FontWeight.w500
                ),
                ),
                SizedBox(height: 8,),
                Text('Max. file size 10 MB', style: TextStyle(color: Colors.grey,)),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity, // تحديد عرض الزر ليكون ممتدًا بعرض الشاشة
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffD6E4FF),
                        side: BorderSide(color: Colors.blue),
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: _pickFile, // عند النقر على زر "Add file"، يفتح متصفح الملفات
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center, // تعيين المحاذاة في المنتصف
                        children: [
                          Image.asset('assets/images/export.png', width: 24, height: 24), // إضافة الصورة داخل الزر
                          SizedBox(width: 8),
                          Text('Add file', style: TextStyle(color: Colors.blue, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
        title: Text('Apply Job'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStepIcon(0, 'Biodata', isCompleted: true, isActive: false),
                  _buildStepLine(isActive: true),
                  _buildStepIcon(1, 'Type of work', isCompleted: true, isActive: false),
                  _buildStepLine(isActive: true),
                  _buildStepIcon(2, 'Upload portfolio', isCompleted: false, isActive: true),
                ],
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Tittle",style: TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w500
                ),),
              ),
              Text(
                'Upload portfolio',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color:
                    Colors.black
                ),
              ),
              Text(
                'Fill in your bio data correctly',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              _buildUploadSection('Upload CV*', 'Rafif Dian.CV', 'CV.pdf 300KB'),
              SizedBox(height: 24),
              _buildOtherFileUploadSection(),
              SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                    ),
                    onPressed: () {
                      // Handle submit action
                    },
                    child: Text('Submit', style: TextStyle(fontSize: 16, color: Colors.white)),
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


