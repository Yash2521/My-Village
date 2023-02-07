import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home.dart';
import 'package:intl/intl.dart';
import 'complain_logic.dart';


class Complain extends StatefulWidget with Complain_Logic {
  @override
  State<Complain> createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {

  bool isLoading = false;
  bool obsure=true;
  final _formkey = GlobalKey<FormState>();
  @override
  final _firestore = FirebaseFirestore.instance;
  final _auth =FirebaseAuth.instance;
  late String name;
  late String address;
  late String email;
  late String pass;
  late String member;
  late String phone;

  Widget build(BuildContext context) {
    TextEditingController complaint_title = TextEditingController();
    TextEditingController complaint_description = TextEditingController();
    String datetime = (DateFormat.Md('en_US').add_jm().format(DateTime.now()));
    void add_data() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      String title = complaint_title.text.trim();
      String description = complaint_description.text.trim();

      complaint_description.clear();
      complaint_title.clear();

      if (title != '' && description != '') {
        firestore.collection('village').doc().set({
          "title": title,
          "description": description,
          "time": datetime
        }).then((result) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Complained Successfully"),
            backgroundColor: Colors.blue,
          ));
        }).catchError((onError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(onError),
            backgroundColor: Colors.blue,
          ));
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: IconButton(
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),)
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Color.fromARGB(255, 0, 141, 241),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                        child: Text(
                          "Complaint",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 5,
                    indent: 12,
                    endIndent: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: SizedBox(
                width: 350,
                // height: 300,
                child: TextField(
                  controller: complaint_title,
                  decoration: InputDecoration(
                      labelText: "Complain Title",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(11, 20, 0, 0),
            //       child: Text(
            //         "Write short discription",
            //         textAlign: TextAlign.start,
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              // height: 200,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextField(
                  controller: complaint_description,
                  decoration: InputDecoration(
                      labelText: "Enter Your Concern Here!!!",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 341,
              height: 78,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    add_data();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(44.0),
                    ),
                  ),
                  child: Text(
                    "Raise Complain",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}