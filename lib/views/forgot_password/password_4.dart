import 'package:flutter/material.dart';
import 'package:jobs_app/views/sign_up/login.dart';

class ForgetPasswordView4 extends StatelessWidget {
  const ForgetPasswordView4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 204), // المسافة من AppBar
          Center(
            child: Image.asset("assets/images/Password Succesfully Ilustration.png"),
          ),
          SizedBox(height: 24),
          Image.asset("assets/images/Tittle (9).png"),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 9.0), // الفارق بين الزر وآخر الشاشة
            child: SizedBox(
              width: 327,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // تحويل المستخدم إلى صفحة LoginView عند الضغط على الزر
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
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


