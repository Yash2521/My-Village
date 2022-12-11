import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Color(0xff3957ed),
      height: 200,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('UserName'),
            accountEmail: Text('User@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assest/user.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color:Color(0xff3957ed),
              ),
            ),
        ],
      ),
    );
  }
}