import 'package:flutter/material.dart';
import 'package:practice/events.dart';
import 'package:practice/home.dart';

class ED extends StatefulWidget {
  @override
  State<ED> createState() => _EDState();
}

class _EDState extends State<ED> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xff3957ed),
        title: Text(
          'Back',
          style: TextStyle(color: Colors.black),
        ),
        leadingWidth: 30,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.push(context,  MaterialPageRoute(builder: (context) => MyHome()),);
          },
        ),
      ),

      body: Center(
        child: Text("Date:26th September 2023 \n Venue: Bapa Sitaram Hall \n Time: 8:30 PM",style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold,),
     ),
    )
    );
  }
}
