import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_app/views/complete_profil/complete_profile.dart';
import 'package:jobs_app/views/complete_profil/education.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _positionController = TextEditingController(text: "Product Designer");
  TextEditingController _companyNameController = TextEditingController(text: "Supafast Studio");
  TextEditingController _locationController = TextEditingController(text: "Purwokerto, Banyumas");
  TextEditingController _startYearController = TextEditingController(text: "February 2021");
  bool _currentlyWorking = true;
  String _typeOfWork = 'Full Time';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CompleteProfile()),
            );
          },
        ),
        title: Text('Experience'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Position *',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff9CA3AF)
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _positionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB), // لون الحدود
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the position';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type of work *',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff9CA3AF)
                            ),
                          ),
                          SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: _typeOfWork,
                            items: [
                              DropdownMenuItem(
                                child: Text('Full Time'),
                                value: 'Full Time',
                              ),
                              DropdownMenuItem(
                                child: Text('Part Time'),
                                value: 'Part Time',
                              ),
                              DropdownMenuItem(
                                child: Text('Freelance'),
                                value: 'Freelance',
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _typeOfWork = value!;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB), // لون الحدود
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Company name *',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff9CA3AF)
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _companyNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB), // لون الحدود
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the company name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location *',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff9CA3AF)
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFD1D5DB)),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                SizedBox(width: 8),
                                Text(
                                  _locationController.text,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _currentlyWorking,
                          onChanged: (bool? value) {
                            setState(() {
                              _currentlyWorking = value!;
                            });
                          },
                        ),
                        Text('I am currently working in this role'),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Year *',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff9CA3AF)
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _startYearController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB), // لون الحدود
                                ),
                              ),

                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the start year';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process data
                          }
                        },
                        child: Text('Save',style: TextStyle(
                            color: Colors.white,fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), backgroundColor: Colors.blue,
                          minimumSize: Size(double.infinity, 50), // match the width of the screen
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: SvgPicture.asset('assets/svg/Group 15495.svg', width: 40),
                  title: Text('Senior UI/UX Designer'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Remote • GrowUp Studio'),
                      Text('2019 - 2022'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: SvgPicture.asset("assets/svg/edit-2.svg"),
                    onPressed: () {
                      // Edit functionality
                    },
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
