import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:jobs_app/cubit/Auth/auth_cubit.dart';
import 'package:jobs_app/cubit/Auth/auth_state.dart';
import 'package:jobs_app/views/forgot_password/password.dart';
import 'package:jobs_app/views/home_screen/search.dart';
import 'package:jobs_app/views/create_account/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;
  bool _isFormValid = false;
  bool _rememberMe = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateForm() {
    setState(() {
      _isFormValid = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
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

  void _login() {
    if (_isFormValid) {
      context.read<AuthCubit>().login(
        _usernameController.text,
        _passwordController.text,
      );
    } else {
      String message = 'Please complete all fields correctly';
      if (_usernameController.text.isEmpty) {
        message = 'Username is required';
      } else if (_passwordController.text.isEmpty) {
        message = 'Password is required';
      }
      _showIncompleteFormMessage(message);
    }
  }

  void _forgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasswordView()),
    );
  }

  void _register() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Register tapped')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateAccount()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/Logo (1).png',
                height: 19,
                width: 81,
              ),
            ],
          ),
        ),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is AuthLoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login successful')),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please login to find your dream job',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 44),
                  TextField(
                    controller: _usernameController,
                    onChanged: (value) {
                      _validateForm();
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "assets/svg/profile (1).svg",
                          color: _usernameController.text.isNotEmpty
                              ? Color(0xFF292D32)
                              : Colors.black.withOpacity(.1),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    onChanged: (value) {
                      _validateForm();
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "assets/svg/lock.svg",
                          color: _passwordController.text.isNotEmpty
                              ? Color(0xFF292D32)
                              : Colors.black.withOpacity(.1),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
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
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text('Remember me'),
                      Spacer(),
                      TextButton(
                        onPressed: _forgotPassword,
                        child: Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  SizedBox(height: 125),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account?'),
                      TextButton(
                        onPressed: _register,
                        child: Text('Register', style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(327, 50),
                        backgroundColor: _isFormValid ? Colors.blue : Color(0xffD1D5DB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: _isFormValid ? Colors.white : Color(0xff6B7280),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(child: Image.asset("assets/images/Or.png")),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: _loginWithGoogle,
                          child: SvgPicture.asset(
                            'assets/svg/google.svg',
                            height: 46,
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
      ),
    );
  }
}
