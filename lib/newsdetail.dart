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
        child: Text("News Detail Page"),
      ),
    );
  }
}
