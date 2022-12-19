import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class adminpanel extends StatefulWidget {
  const adminpanel({super.key});

  @override
  State<adminpanel> createState() => _adminpanelState();
}

class _adminpanelState extends State<adminpanel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Admin panel'),
          ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('village').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        return SingleChildScrollView(
                          // child: Container(
                          //   width: 200,
                          //   height: 100,
                          //   color: Colors.green.shade200,
                            child: Column(
                             children:[
                                Card(
                                  child:ListTile(
                                    leading:Image(image: AssetImage('assest/user.png'),width: 50),
                                    title: Text("Name :" + snapshot.data!.docs[i]['name']),
                                    subtitle:Text("Email :" + snapshot.data!.docs[i]['email']),
                                    onTap: (){
                                    },
                                  ),),
                              ],
                            ),
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
              ),
          ),
    );
    }
}