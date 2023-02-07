import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/login.dart';

bool showPassword = false;

class UpdatePage extends StatefulWidget {
   const UpdatePage({Key? key, required this.title}) : super(key: key);
   final String title;
   @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final currentuser = FirebaseAuth.instance;
  final firestore=FirebaseFirestore.instance;
  var user=FirebaseAuth.instance.currentUser;

  bool obsure=true;
  late String email=widget.title;
  late String name;
  late String add;
  late String member;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                Text( '${widget.title}',
                  style: TextStyle(fontSize: 54),
                ),
                  Text(
                    "Edit Details",
                    style: GoogleFonts.anton(fontSize: 25, fontWeight: FontWeight.w500)
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme
                                      .of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assest/user.png'))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Theme
                                      .of(context)
                                      .scaffoldBackgroundColor,
                                ),
                                color: Color(0xff3957ed),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      onChanged: (v){
                        name=v;
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
                          prefixIcon: Icon(Icons.person_outline),
                          labelText:"Full Name",
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
                      onChanged: (v){
                        add=v;
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

                          prefixIcon: Icon(Icons.home_work_outlined),
                          labelText:"Home Location",
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
                      onChanged: (v){
                        member=v;
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
                          prefixIcon: Icon(Icons.family_restroom),
                          labelText:"Family members",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w800,
                          )
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      onChanged: (v){
                        phone=v;
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
                          prefixIcon: Icon(Icons.phone),
                          labelText:"Phone number",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w800,
                          )
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          DocumentReference documentReference =
                          firestore.collection('village').doc(user!.email);
                          //await FirebaseFirestore.instance.collection('village').doc(email);
                          documentReference.update({'name':name,'address':add,'member':member,'phone':phone});
                          Navigator.pushNamed(context, 'home');},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff3957ed)),
                        ),
 
                       child: Text("Update Details",style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                       ),),
                      ),
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