import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Color(0xff3957ed),
        width: double.infinity,
        height: 180,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assest/user.png'),
                ),
              ),
              ),
            Text(
              "User",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "user123@gmail.com",
              style: TextStyle(color: Colors.grey[200], fontSize: 14),
            ),
          ],

      ),
    );
  }
}

