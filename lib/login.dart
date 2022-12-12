import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/home.dart';
import 'package:practice/loading.dart';
import 'package:practice/register.dart';

class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool isLoading = false;
  @override
  late String email;
  late String pass;
  @override
  void initState() {
    email = "Flutter Campus";
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child:Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Icon(Icons.person_outline_outlined,color: Theme.of(context).primaryColor,size: 90,),
                  SizedBox(height: 10),

                  Text("Welcome Back", style: TextStyle(
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
                          primary: Colors.blue
                      ),
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                            email: email, password: pass)
                            .then((FirebaseUser) {
                          Navigator.push(context,  MaterialPageRoute(builder: (context) => MyHome()),);
                        })
                            .catchError((e) {
                          if (e.code == 'user-not-found') {
                            print("No User Found for that Email");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.lightBlue,
                                content: Text(
                                  "No User Found for that Email",
                                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                                ),
                              ),
                            );
                          }
                          else if (e.code == 'wrong-password') {
                            print("Wrong Password Provided by User");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.lightBlue,
                                content: Text(
                                  "Wrong Password Provided by User",
                                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                                ),
                              ),
                            );
                          }
                        });

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

                      // color: Theme.of(context).primaryColor,
                      // textColor: Colors.white,
                      // onPressed: (){Navigator.pushNamed(context, 'home');},
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular (12),
                      // ),
                      // onPressed: (){
                      //   FirebaseAuth.instance
                      //       .signInWithEmailAndPassword(
                      //       email: email, password: pass)
                      //       .then((FirebaseUser) {
                      //     Navigator.push(context,  MaterialPageRoute(builder: (context) => MyHome()),);
                      //   })
                      //       .catchError((e) {
                      //     if (e.code == 'user-not-found') {
                      //       print("No User Found for that Email");
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           backgroundColor: Colors.lightBlue,
                      //           content: Text(
                      //             "No User Found for that Email",
                      //             style: TextStyle(fontSize: 18.0, color: Colors.black),
                      //           ),
                      //         ),
                      //       );
                      //     }
                      //     else if (e.code == 'wrong-password') {
                      //       print("Wrong Password Provided by User");
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           backgroundColor: Colors.lightBlue,
                      //           content: Text(
                      //             "Wrong Password Provided by User",
                      //             style: TextStyle(fontSize: 18.0, color: Colors.black),
                      //           ),
                      //         ),
                      //       );
                      //     }
                      //   });
                        //Navigator.pushNamed(context, 'home');
                      //},
                     // child: Text("Login"),

                    ),
                  ),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 17,
                        ), // TextStyle
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,  MaterialPageRoute(builder: (context) => MyRegister()),);
                          },
                        child: Text(
                          "Register",
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
      ),
    );
  }
}

