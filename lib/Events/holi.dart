import 'package:flutter/material.dart';
import 'package:practice/Drawer/events.dart';
import 'package:practice/home.dart';

class HO extends StatefulWidget {
  @override
  State<HO> createState() => _HOState();
}

class _HOState extends State<HO> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            child: Text("Date: 18th March 2023 \nVenue: Village Ground \nTime: 7:00 PM",style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold,),
            ),
          )
      ),
    );
  }
}
