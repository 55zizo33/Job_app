import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/forgot_password/password_2.dart';

class ForgetPasswordView3 extends StatefulWidget {
  const ForgetPasswordView3({super.key});

  @override
  _ForgetPasswordView3State createState() => _ForgetPasswordView3State();
}

class _ForgetPasswordView3State extends State<ForgetPasswordView3> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isPasswordFieldFocused = false;
  bool _isConfirmPasswordFieldFocused = false;

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
              MaterialPageRoute(builder: (context) => ForgetPassword2()),
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
                SizedBox(height: 39), // المسافة بين AppBar والنص
                Text(
                  'Create new password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Set your new password so you can login and access Jobsque',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 44), // المسافة بين النص والخانة الأولى
                Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isPasswordFieldFocused = hasFocus;
                    });
                  },
                  child: TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "assets/svg/lock.svg",
                          color: _isPasswordFieldFocused
                              ? Color(0xFF292D32)
                              : Colors.grey,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.blue), // لون الحدود
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.blue), // لون الحدود عند التركيز
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12), // المسافة بين الخانة الأولى والنص أسفلها
                Text(
                  'Password must be at least 8 characters',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 60), // المسافة بين الخانتين
                Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isConfirmPasswordFieldFocused = hasFocus;
                    });
                  },
                  child: TextField(
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "assets/svg/lock.svg",
                          color: _isConfirmPasswordFieldFocused
                              ? Color(0xFF292D32)
                              : Colors.grey,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.blue), // لون الحدود
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.blue), // لون الحدود عند التركيز
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 9), // المسافة بين الخانة الثانية والنص أسفلها
                Text(
                  'Both passwords must match',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 200), // المسافة بين النص والزر
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // تنفيذ إجراء إعادة تعيين كلمة المرور
                      print('Reset password');
                    },
                    child: SizedBox(
                      width: 327,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // تنفيذ إجراء إعادة تعيين كلمة المرور
                          print('Reset password');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 113,
                            height: 21,
                            child: Center(
                              child: Text(
                                'Reset password',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
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

