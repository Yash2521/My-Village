import 'package:flutter/material.dart';
import 'home.dart';

class ND extends StatelessWidget {
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
          },
        ),
      ),
      body: Center(
        child: Text("New Delhi: India on Monday stoutly defended its import of crude oil from Russia amid the Ukraine conflict with External Affairs Minister S Jaishankar asserting that New Delhi's procurement was just one-sixth of the European purchase in the last nine months, in comments that came as a G7 price cap on Russian crude at 60 a barrel came into effect."),
      ),
    );
  }
}
