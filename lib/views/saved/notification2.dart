import 'package:flutter/material.dart';
import 'package:jobs_app/views/saved/notification.dart';
import 'package:jobs_app/views/saved/save_job.dart';

class Notification2 extends StatelessWidget {
  const Notification2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Notification',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaveJob()),
              );
            },
          ),
        ),
       body: Center(
         child: Column(

           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         Image.asset("assets/images/notification.png"),
            SizedBox(height:24,),
            Image.asset("assets/images/text 15.png")
          ],
             ),
       ),
    );
  }
}
