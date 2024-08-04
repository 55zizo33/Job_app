import 'package:flutter/material.dart';
import 'package:jobs_app/views/forgot_password/password_3.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgetPassword2 extends StatelessWidget {
  const ForgetPassword2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 204), // المسافة من AppBar
          Center(
            child: Image.asset("assets/images/Email Ilustration.png"),
          ),
          SizedBox(height: 24),
          Image.asset("assets/images/Tittle (7).png"),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 9.0), // الفارق بين الزرار وآخر الشاشة
            child: SizedBox(
              width: 327,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPasswordView3()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2979FF), // لون الخلفية الأزرق
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0), // حواف دائرية
                  ),
                ),
                child: Center(
                  child: Text(
                    'Open email app',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // لون النص أبيض
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
