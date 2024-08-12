import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Help Center'),
        centerTitle: true, // لجعل النص في المنتصف
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 327,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xffD1D5DB).withOpacity(.1),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Color(0xFFD1D5DB)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'What can we help?',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  buildExpansionTile(
                    title: 'Lorem ipsum dolor sit amet',
                    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas ac ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate.',
                  ),
                  buildExpansionTile(
                    title: 'Lorem ipsum dolor sit amet',
                    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas ac ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate.',
                  ),
                  buildExpansionTile(
                    title: 'Lorem ipsum dolor sit amet',
                    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas ac ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate.',
                  ),
                  buildExpansionTile(
                    title: 'Lorem ipsum dolor sit amet',
                    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas ac ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate.',
                  ),
                  buildExpansionTile(
                    title: 'Lorem ipsum dolor sit amet',
                    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas ac ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExpansionTile({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD1D5DB)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          title: Text(title),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(content),
            ),
          ],
        ),
      ),
    );
  }
}


