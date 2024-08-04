import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:jobs_app/views/create_account/working.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _obscureText = true;
  bool _isFormValid = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateForm() {
    setState(() {
      _isFormValid = _usernameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showIncompleteFormMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _loginWithGoogle() async {
    GoogleSignInAccount? account = await GoogleSignIn().signIn();
    if (account != null) {
      print("User signed in with Google: ${account.email}");
    }
  }

  Future<void> _loginWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();
        print("User signed in with Facebook: ${userData['email']}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed in with Facebook: ${userData['email']}')),
        );
      } else {
        print("Facebook login failed: ${result.status}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Facebook login failed: ${result.status}')),
        );
      }
    } catch (e) {
      print("Error during Facebook login: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during Facebook login: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  'Create Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Please create an account to find your dream job',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: _usernameController,
                  onChanged: (value) => _validateForm(),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/profile.png",
                        color: Color(0xff9CA3AF),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Color(0xff9CA3AF)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  onChanged: (value) => _validateForm(),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/sms.png",
                        color: Color(0xff9CA3AF),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color:  Color(0xff9CA3AF)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  onChanged: (value) => _validateForm(),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        "assets/svg/lock (1).svg",
                        color:  Color(0xff9CA3AF),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Color(0xff9CA3AF)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Password must be at least 8 characters',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {},
                      child: Text('Login', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(

                    onPressed: _isFormValid
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkingView()),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                      backgroundColor: _isFormValid ? Colors.blue : Color(0xffD1D5DB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Create account',
                      style: TextStyle(
                        fontSize: 16,
                        color: _isFormValid ? Colors.white : Color(0xff6B7280),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(child: Text('Or Sign Up With Account')),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: _loginWithGoogle,
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffD1D5DB)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google2.png',
                                height: 24,
                                width: 24,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 8),
                              Text('Google', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: _loginWithFacebook,
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffD1D5DB)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Facebook Logo.png',
                                height: 24,
                                width: 24,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 8),
                              Text('Facebook', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


