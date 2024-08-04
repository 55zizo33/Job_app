import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/profile_setting/login_security.dart';

class TwoStepVerification extends StatefulWidget {
  const TwoStepVerification({super.key});

  @override
  _TwoStepVerificationState createState() => _TwoStepVerificationState();
}

class _TwoStepVerificationState extends State<TwoStepVerification> {
  bool isTwoStepEnabled = false;
  String selectedMethod = 'Telephone number (SMS)';
  final PageController _pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < 3) {
      setState(() {
        currentPage++;
        _pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
        _pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

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
              MaterialPageRoute(builder: (context) => LoginSecurity()),
            );
          },
        ),
        title: Text(
          'Two-step verification',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          buildStep1(),
          buildStep2(),
          buildStep3(),
          buildStep4(),
        ],
      ),
    );
  }

  Widget buildStep1() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SwitchListTile(
              title: Text('Secure your account with two-step verification'),
              value: isTwoStepEnabled,
              onChanged: (bool value) {
                setState(() {
                  isTwoStepEnabled = value;
                  if (value) {
                    nextPage();
                  }
                });
              },
            ),
          ),
          if (!isTwoStepEnabled) ...[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFD6E4FF),
                radius: 22,
                child: SvgPicture.asset(
                  'assets/svg/lock.svg',
                  color: Colors.blue,
                  width: 24,
                  height: 24,
                ),
              ),
              title: Text(
                'Two-step verification provides additional security by asking for a verification code every time you log in on another device.',
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFD6E4FF),
                radius: 22,
                child: SvgPicture.asset(
                  'assets/svg/external-drive.svg',
                  color: Colors.blue,
                  width: 24,
                  height: 24,
                ),
              ),
              title: Text(
                'Adding a phone number or using an authenticator will help keep your account safe from harm.',
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildStep2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select a verification method',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Telephone number (SMS)',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Note: Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign in with a new device or mobile application.',
          ),
          Spacer(),
          Center(
            child: SizedBox(
              width: 327,
              height: 48,
              child: ElevatedButton(
                onPressed: nextPage,
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStep3() {
    bool _isOldPasswordVisible = false;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add phone number', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4,),
          Text('We will send a verification code to this number'),
          SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffD1D5DB), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffD1D5DB), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/FLAG.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
                          Container(
                            height: 24,
                            width: 1,
                            color: Color(0xffD1D5DB),
                            margin: EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ],
                      ),
                    ),
                    hintText: '0100-666-7234',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Enter your password',style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 8,),
          TextField(
            obscureText: !_isOldPasswordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffD1D5DB), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffD1D5DB), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/svg/lock (1).svg',
                  width: 24,
                  height: 24,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  _isOldPasswordVisible ? 'assets/svg/eye.svg' : 'assets/svg/eye-slash.svg',
                  width: 24,
                  height: 24,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isOldPasswordVisible = !_isOldPasswordVisible;
                  });
                },
              ),
              hintText: 'Enter your password',
            ),
          ),
          Spacer(),
          Center(
            child: SizedBox(
              width: 327,
              height: 48,
              child: ElevatedButton(
                onPressed: nextPage,
                child: Text(
                  'Send Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStep4() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter the 6 digit code', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 12,),
          Text('Please confirm your account by entering the authorization code sent to ****-****-7234'),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildVerificationCodeBox(),
              _buildVerificationCodeBox(),
              _buildVerificationCodeBox(),
              _buildVerificationCodeBox(),
              _buildVerificationCodeBox(),
              _buildVerificationCodeBox(),
            ],
          ),
          SizedBox(height: 16),
          Text('Resend code 42s', style: TextStyle(color: Colors.blue)),
          Spacer(),
          Center(
            child: SizedBox(
              width: 327,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // تحقق من الرمز
                },
                child: Text(
                  'Verify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationCodeBox() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(1)],
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
