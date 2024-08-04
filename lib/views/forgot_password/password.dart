import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/sign_up/login.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

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
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          },
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox.shrink(),
            Image.asset(
              'assets/images/Logo (1).png',
              height: 19,
              width: 81,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Enter the email address you used when you joined and we\'ll send you instructions to reset your password.',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 40),
                EmailTextField(),
                SizedBox(height: 320),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'You remember your password? ',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontWeight: FontWeight.w500, // هنا يتم تعيين الوزن المتوسط
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Color(0xFF3366FF),
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginView()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 327,
                    child: ElevatedButton(
                      onPressed: () {
                        // تنفيذ إجراء إعادة تعيين كلمة المرور
                        print('Request password reset tapped');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: Colors.blue,
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        'Request password reset',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 9), // تعديل المسافة إلى 9
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailTextField extends StatefulWidget {
  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final FocusNode _focusNode = FocusNode();
  Color _iconColor = Colors.black.withOpacity(.1);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _iconColor = _focusNode.hasFocus ? Color(0xFF292D32) : Colors.black.withOpacity(.1);
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(

      focusNode: _focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFD1D5DB).withOpacity(.1),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            "assets/svg/sms.svg",
            color: _iconColor,
            fit: BoxFit.scaleDown,
          ),
        ),
        hintText: 'Enter your email...',
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.1)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFD1D5DB), width: 20.0),
        ),
      ),
    );
  }
}
