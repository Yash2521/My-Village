import 'package:flutter/material.dart';
import 'package:practice/events.dart';
import 'package:practice/home.dart';

class DU extends StatefulWidget {
  @override
  State<DU> createState() => _DUState();
}

class _DUState extends State<DU> {
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
          child: Text("Date:5th October 2023 \n Venue: Village Ground  \n Time: 9:30 PM",style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold,),
          ),
        )
    );
  }
}
