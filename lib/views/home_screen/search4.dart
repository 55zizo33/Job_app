import 'package:flutter/material.dart';
import 'package:jobs_app/views/home_screen/search3.dart';
import '../search5.dart'; // تأكد من أن المسار إلى صفحة Search3View صحيح

class Search4View extends StatefulWidget {
  const Search4View({super.key});

  @override
  _Search4ViewState createState() => _Search4ViewState();
}

class _Search4ViewState extends State<Search4View> {
  List<bool> isSelected = [false, false, false, false, false, false];

  void _showOptions(BuildContext context, String title, List<String> options) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options.map((String option) {
              return ListTile(
                title: Text(option),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$option selected')),
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Filter'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Search3View()),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isSelected = [false, false, false, false, false, false];
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Reset filters')),
                );
              });
            },
            child: Text(
              'Reset',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Job Title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _showOptions(context, 'Job Title', ['UI/UX Designer', 'Project Manager', 'Product Designer']);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.work_outline),
                    SizedBox(width: 8),
                    Text('UI/UX Designer'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _showOptions(context, 'Location', ['Jakarta, Indonesia', 'New York, USA', 'London, UK']);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 8),
                    Text('Jakarta, Indonesia'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Salary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _showOptions(context, 'Salary', ['\$5K - \$10K', '\$10K - \$15K', '\$15K - \$20K']);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 8),
                    Text('\$5K - \$10K'),
                    Spacer(),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Job Type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                JobTypeChip(
                  label: 'Full Time',
                  isSelected: isSelected[0],
                  onTap: () {
                    setState(() {
                      isSelected[0] = !isSelected[0];
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Full Time selected')),
                    );
                  },
                ),
                JobTypeChip(
                  label: 'Remote',
                  isSelected: isSelected[1],
                  onTap: () {
                    setState(() {
                      isSelected[1] = !isSelected[1];
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Remote selected')),
                    );
                  },
                ),
                JobTypeChip(
                  label: 'Contract',
                  isSelected: isSelected[2],
                  onTap: () {
                    setState(() {
                      isSelected[2] = !isSelected[2];
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Contract selected')),
                    );
                  },
                ),
                JobTypeChip(
                  label: 'Part Time',
                  isSelected: isSelected[3],
                  onTap: () {
                    setState(() {
                      isSelected[3] = !isSelected[3];
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Part Time selected')),
                    );
                  },
                ),
                JobTypeChip(
                  label: 'Onsite',
                  isSelected: isSelected[4],
                  onTap: () {
                    setState(() {
                      isSelected[4] = !isSelected[4];
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Onsite selected')),
                    );
                  },
                ),
                JobTypeChip(
                  label: 'Internship',
                  isSelected: isSelected[5],
                  onTap: () {
                    setState(() {
                      isSelected[5] = !isSelected[5];
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Internship selected')),
                    );
                  },
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Show result clicked')),
                  );
                },
                child: Text('Show result',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // شكل بيضاوي
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobTypeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  JobTypeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
