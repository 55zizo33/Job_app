import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/complete_profil/complete_profile.dart';
import 'package:jobs_app/views/home_screen/search.dart';
import 'package:jobs_app/views/sign_in/login.dart';
import 'terms.dart';
import 'privacy_policy.dart';
import 'help_center.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 195.5,
            width: double.infinity,
            color: const Color(0xFFD6E4FF),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 130),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/Profile (1).png"),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Rafif Dian Axelmega',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text('Senior UI/UX Designer'),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatContainer('Applied', '46'),
                        _buildVerticalDivider(),
                        _buildStatContainer('Reviewed', '23'),
                        _buildVerticalDivider(),
                        _buildStatContainer('Contacted', '16'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'About',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              // Add the edit functionality here
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'I\'m Rafif Dian Axelmega, I\'m a UI/UX Designer. I have experience designing UI/UX for mobile apps and web apps. I\'m passionate about creating user-friendly and delightful interfaces to elevate what I dream of.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildSectionDivider('General'),
                _buildListTile(context, 'Edit Profile', 'assets/svg/profile (1).svg', '/edit_profile'),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                _buildListTile(context, 'Portfolio', 'assets/svg/folder-favorite.svg', '/portfolio'),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                _buildListTile(context, 'Language', 'assets/svg/global.svg', '/language'),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                _buildListTile(context, 'Notification', 'assets/svg/notification.svg', '/notification'),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                _buildListTile(context, 'Login and security', 'assets/svg/lock.svg', '/login_security'),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFD6E4FF),
                    child: SvgPicture.asset(
                      'assets/svg/profile.svg',
                      width: 24,
                      height: 24,
                      color: Colors.blue,
                    ),
                  ),
                  title: Text('Complete Profile'),
                  trailing: Icon(Icons.arrow_forward_outlined, color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CompleteProfile()), // التنقل إلى صفحة CompleteProfile
                    );
                  },
                ),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                SizedBox(height: 32,),
                _buildSectionDivider('Others'),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/svg/accessibility.svg',
                    width: 24,
                    height: 24,
                    color: Colors.blue,
                  ),
                  title: Text('Accessibility'),
                  trailing: Icon(Icons.arrow_forward_outlined, color: Colors.black),
                  onTap: () {
                    // هنا يمكنك إضافة التنقل للشاشة المقابلة
                  },
                ),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/svg/help.svg',
                    width: 24,
                    height: 24,
                    color: Colors.blue,
                  ),
                  title: Text('Help Center'),
                  trailing: Icon(Icons.arrow_forward_outlined, color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpCenter()), // Navigate to HelpCenter
                    );
                  },
                ),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/svg/terms.svg',
                    width: 24,
                    height: 24,
                    color: Colors.blue,
                  ),
                  title: Text('Terms & Conditions'),
                  trailing: Icon(Icons.arrow_forward_outlined, color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Terms()), // Navigate to Terms
                    );
                  },
                ),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/svg/privacy.svg',
                    width: 24,
                    height: 24,
                    color: Colors.blue,
                  ),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_outlined, color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()), // Navigate to PrivacyPolicy
                    );
                  },
                ),
                Divider(color: Color(0xFFD1D5DB), indent: 16.0, endIndent: 16.0),
                SizedBox(height: 30,)
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchView()), // التنقل إلى صفحة SearchView عند الضغط على السهم
                  );
                },
              ),
              title: Text('Profile'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.logout, color: Colors.red),
                  onPressed: () {
                    // تنفيذ عملية تسجيل الخروج
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()), // التنقل إلى صفحة تسجيل الدخول
                    );
                  },
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/home (3).svg", color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/message.svg", color: Colors.grey),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/briefcase.svg", color: Colors.grey),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/archive-minus.svg", color: Colors.grey),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue),
            label: 'Profile',
          ),
        ],
        currentIndex: 4, // Profile is selected
        selectedItemColor: Colors.blue,
        unselectedItemColor: Color(0xff9CA3AF),
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginView()), // Navigate to AppliedJob4
            );
          }
          // أضف التنقل للشاشات الأخرى إذا لزم الأمر
        },
      ),
    );
  }

  Widget _buildStatContainer(String title, String count) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            count,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 50,
      width: 1,
      color: Colors.grey,
    );
  }

  Widget _buildListTile(BuildContext context, String title, String assetPath, String routeName) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xFFD6E4FF),
        child: SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
          color: Colors.blue,
        ),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_outlined, color: Colors.black),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  Widget _buildSectionDivider(String text) {
    return Container(
      height: 36,
      width: double.infinity,
      color: Color(0xFFE5E7EB),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        text,
        style: TextStyle(color: Color(0xFF6B7280), fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
