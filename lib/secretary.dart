import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/home.dart';
import 'package:practice/loading.dart';
import 'package:practice/register.dart';

class MySecretary extends StatefulWidget {
  @override
  State<MySecretary> createState() => _MySecretary();
}

class _MySecretary extends State<MySecretary> {
  bool isLoading = false;
  bool obsure=true;
  final _formkey = GlobalKey<FormState>();
  @override
  late String aemail;
  late String apass;
  @override
  void initState() {
    aemail = "Flutter Campus";
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton( icon: Icon(Icons.arrow_back,
                          size:30,
                          color: Theme.of(context).primaryColor,
                        ), onPressed: (){Navigator.pop(context);},
                        ),
                      ],
                    ),

                    Icon(Icons.security,color: Theme.of(context).primaryColor,size: 90,),

                    SizedBox(height: 10),

                    Text("Secretary Login", style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold,
                    ),),

                    Text("Sign in to continue",style: TextStyle(
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
                          aemail=value;
                        },
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return'*Required field';
                          }
                        },
                        decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderSide: BorderSide(width: 2,color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5,color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
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
                          apass=value;
                        },
                        obscureText: obsure,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,

                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return'*Required field';
                          }
                        },
                        decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderSide: BorderSide(width: 2,color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5,color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            prefixIcon: Icon(Icons.phonelink_lock_outlined),
                            suffixIcon: GestureDetector(
                              child: obsure?Icon(Icons.visibility_off):Icon(Icons.visibility),
                              onTap: (){
                                setState(() {
                                  obsure=!obsure;
                                });
                              },
                            ),
                            labelText:"Password",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800,
                            )
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 55,
                     width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                        onPressed: () {
                          if(!_formkey.currentState!.validate()){
                            return;
                          }
                        FirebaseFirestore.instance
                            .collection('admin')
                            .doc('adminLogin')
                            .snapshots()
                            .forEach((element) {
                        if (element.data()?['adminEmail'] == aemail &&
                        element.data()?['adminPass'] == apass) {
                        Navigator.pushNamed(context, 'adminpanel');
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.lightBlue,
                                content: Text(
                                  "Please enter valid credentials of admin",
                                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                                ),
                              ),);
                          }
                        });

                          //     .catchError((e) {
                          // if (e.code == 'user-not-found') {
                          //   print("Please Enter valid email Id");
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(
                          //         backgroundColor: Colors.lightBlue,
                          //         content: Text(
                          //           "Please Enter valid email Id",
                          //           style: TextStyle(fontSize: 18.0, color: Colors.black),
                          //         ),
                          //       ),
                          //     );
                          //   }
                          //   else if (e.code == 'wrong-password') {
                          //     print("Wrong password!!");
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(
                          //         backgroundColor: Colors.lightBlue,
                          //         content: Text(
                          //           "Wrong Password!!",
                          //           style: TextStyle(fontSize: 18.0, color: Colors.black),
                          //         ),
                          //       ),
                          //     );
                          //   }
                          // });

                          setState(() {
                            isLoading = true;
                          });

                          // we had used future delayed to stop loading after
                          // 3 seconds and show text "submit" on the screen.
                          Future.delayed(const Duration(seconds: 3), (){
                            setState(() {
                              isLoading = false;
                            });
                          }
                          );
                        }, child: isLoading? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // as elevated button gets clicked we will see text"Loading..."
                        // on the screen with circular progress indicator white in color.
                        //as loading gets stopped "Submit" will be displayed
                        children: const [
                          // Text('Loading...', style: TextStyle(fontSize: 20),),
                          SizedBox(width: 10,),
                          CircularProgressIndicator(color: Colors.white,),
                        ],
                      ) : const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

