import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
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


  @override
  void initState() {
    name = "Flutter Campus";
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
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
                      ), onPressed: (){Navigator.pop(context, 'login');},
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
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return '*Required field ';
                          }
                        },
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderSide: BorderSide(width: 2,color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5,color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
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
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return '*Required field ';
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      onChanged: (value){
                        member=value;
                      },
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                          {
                            return '*Required field ';
                          }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border:OutlineInputBorder(
                              borderSide: BorderSide(width: 2,color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.5,color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          prefixIcon: Icon(Icons.family_restroom),
                          labelText:"Family Members",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w800,
                          )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return'*Required field';
                        }else if(value.length>10){
                          return'*Phone number must be of 10 digits';
                        }
                      },
                      onChanged: (value){
                        phone=value;
                      },keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                          border:OutlineInputBorder(
                              borderSide: BorderSide(width: 2,color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.5,color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          prefixIcon: Icon(Icons.phone),
                          labelText:"Phone number",
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
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return '*Required field';
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
                        pass=value;
                      },
                      obscureText: obsure,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return '*Required field';
                        }else if(value.length>6){
                            return'*Password must has 6 digits';
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

                  SizedBox(height: 10),

                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      // color: Theme.of(context).primaryColor,
                      // textColor: Colors.white,
                      // onPressed: (){Navigator.pushNamed(context, 'home');},
                       style: ElevatedButton.styleFrom(
                         primary: Colors.blue,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20)
                         )
                       ),
                      onPressed: (){
                             if(!_formkey.currentState!.validate()){
                               return;
                             }
                        _auth
                            .createUserWithEmailAndPassword(
                            email: email, password: pass)
                            .then((signedInUser) async {
                          DocumentReference documentReference=await _firestore.collection("village").doc(email);
                          documentReference.set({
                            'email': email,
                            'name': name,
                            'pass': pass,
                            'address': address,
                            "uid": _auth.currentUser!.uid,
                            'member': member,
                            'phone': phone,
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
                        //Navigator.pushNamed(context, 'home');
                       },
                      child: isLoading? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // as elevated button gets clicked we will see text"Loading..."
                        // on the screen with circular progress indicator white in color.
                        //as loading gets stopped "Submit" will be displayed
                        children: const [
                          // Text('Loading...', style: TextStyle(fontSize: 20),),
                          SizedBox(width: 10,),
                          CircularProgressIndicator(color: Colors.white),
                        ],
                      ) : const Text('Create Account'),
                      //child: Text("Create Account"),
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
      ),
        ),
    );
  }
}

