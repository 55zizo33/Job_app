import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobs_app/views/on_boarding/onboarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -163,
                top: 51,
                child: Container(
                  width: 701.31,
                  height: 700,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 701.31,
                          height: 700,
                          decoration: ShapeDecoration(
                            color: Color(0x23D6E4FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 83,
                        top: 83,
                        child: Container(
                          width: 534,
                          height: 533,
                          decoration: ShapeDecoration(
                            color: Color(0x23D6E4FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 178,
                        top: 178,
                        child: Container(
                          width: 344,
                          height: 343,
                          decoration: ShapeDecoration(
                            color: Color(0x23D6E4FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 255,
                        top: 255,
                        child: Container(
                          width: 190,
                          height: 189,
                          decoration: ShapeDecoration(
                            color: Color(0x23D6E4FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 117,
                top: 389,
                child: Container(
                  width: 141,
                  height: 33,
                  child: Stack(
                    children: [
                      Image.asset("assets/images/Logo (1).png",
                        height: 33, width: 141,
                      )
                    ],
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
