import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
         child:Column(
           children: [
            SizedBox(
             height: 8,
            ),

    Container(
    width: 400,
    height: 70,
    child: Image.asset('assest/contact.jpg')
    ),
        // body: Center(
        // child: Text("Contacts Page"),
        // ),
    ],
    ),
    ),
    );
  }
}
