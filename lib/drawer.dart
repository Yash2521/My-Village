import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);
  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  final currentuser=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Color(0xff3957ed),
      height: 200,
      child: ListView(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("village")
               .where("uid", isEqualTo: currentuser.currentUser!.uid)
                 .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context , i){
                      var data = snapshot.data!.docs[i];
                     return UserAccountsDrawerHeader(
                          accountName: Text(data['name']),
                          accountEmail: Text(data['email']),
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
                            color: Color(0xff3957ed),
                          ),
                       );
                    });
              }
              else {
                return CircularProgressIndicator();
              }
            })
        ],
      ),
    );
  }
}