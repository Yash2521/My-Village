import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  final _firestore = FirebaseFirestore.instance;
  final _auth =FirebaseAuth.instance;
  late String name;
  late String address;
  late String email;
  late String pass;

  @override
  void initState() {
    name = "Flutter Campus";
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton( icon: Icon(Icons.arrow_back,
                      size:30,
                      color: Theme.of(context).primaryColor,
                    ), onPressed: (){Navigator.pushNamed(context, 'login');},
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Icon(Icons.person,color: Theme.of(context).primaryColor,size: 90,),
                SizedBox(height: 10),

                Text("Create Account", style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold,
                ),),

                Text("Create a new account",style: TextStyle(
                  fontSize:14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
                ),

                SizedBox(height: 30,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      onChanged: (value){
                        name=value;
                      },
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          labelText:"Name",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w800,
                          )
                      ),
                    ),
                  ),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: TextFormField(
                    onChanged: (value){
                      address=value;
                    },
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.home_work_outlined),
                        labelText:"Home Address",
                        // onChanged: (value){
                        //   email=value;
                        // },
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                    ),
                  ),
                ),


                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: TextFormField(
                    onChanged: (value){
                      email=value;
                    },
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.mark_email_unread_outlined),
                        labelText:"Enter Email",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: TextFormField(
                    onChanged: (value){
                      pass=value;
                    },
                    obscureText: true,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phonelink_lock_outlined),
                        labelText:"Password",
                        // onChanged: (value){
                        //   email=value;
                        // },
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                    ),
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    // color: Theme.of(context).primaryColor,
                    // textColor: Colors.white,
                    // onPressed: (){Navigator.pushNamed(context, 'home');},
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular (12),
                    // ),
                    onPressed: (){
                      _auth
                          .createUserWithEmailAndPassword(
                          email: email, password: pass)
                          .then((signedInUser) {
                        _firestore.collection("village").add({
                          'email': email,
                          'name': name,
                          'pass': pass,
                          'address': address,
                          "uid": _auth.currentUser!.uid
                        }).then((value) {
                          if (signedInUser != null) {
                            Navigator.push(context,  MaterialPageRoute(builder: (context) => MyLogin()),);
                          }
                        }).catchError((e) {
                          print(e);
                        });
                      }).catchError((e) {
                        print(e);
                      });
                      //Navigator.pushNamed(context, 'home');
                     },
                    child: Text("Create Account"),
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 17,
                      ), // TextStyle
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,  MaterialPageRoute(builder: (context) => MyLogin()),);
                        },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Theme.of (context).primaryColor,
                          fontWeight: FontWeight.bold, fontSize: 17,
                        ) ,),
                    ),// Text
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

