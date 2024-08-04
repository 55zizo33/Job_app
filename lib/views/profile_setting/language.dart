import 'package:flutter/material.dart';
import 'package:jobs_app/views/profile_setting/profile.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String _selectedLanguage = 'English';

  final List<Map<String, String>> _languages = [
    {'name': 'English', 'flag': 'assets/images/England.png'},
    {'name': 'Indonesia', 'flag': 'assets/images/Indonesia2.png'},
    {'name': 'Arabic', 'flag': 'assets/images/Saudi Arabia2.png'},
    {'name': 'Chinese', 'flag': 'assets/images/China2.png'},
    {'name': 'Dutch', 'flag': 'assets/images/Netherlands.png'},
    {'name': 'French', 'flag': 'assets/images/France.png'},
    {'name': 'German', 'flag': 'assets/images/Germany.png'},
    {'name': 'Japanese', 'flag': 'assets/images/Japan.png'},
    {'name': 'Korean', 'flag': 'assets/images/South Korea.png'},
    {'name': 'Portuguese', 'flag': 'assets/images/Portugal.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Profile()),);
          },
        ),
        title: Text('Language'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              _languages[index]['flag']!,
              width: 32,
              height: 32,
            ),
            title: Text(_languages[index]['name']!),
            trailing: Radio<String>(
              value: _languages[index]['name']!,
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
            onTap: () {
              setState(() {
                _selectedLanguage = _languages[index]['name']!;
              });
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Language(),
    ),
  );
}
