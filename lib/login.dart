

import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
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
                  Icon(Icons.person_outlined,color: Theme.of(context).primaryColor,size: 90,),
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
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone_android),
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
                      obscureText: true,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,

                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          labelText:"Password",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w800,
                          )
                      ),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(onPressed: () {},
                  //         child: Text("Forgot Password?",style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //           color: Theme.of(context).primaryColor,
                  //         ),))
                  //   ],
                  // ),

                  SizedBox(height: 10),
                 Row(
                   children: [
                     SizedBox(
                       width: 165,
                     ),
                     GestureDetector(
                       onTap: () {Navigator.pushNamed(context, 'forget');},
                       child: Text(
                         "Forgot password?",
                         style: TextStyle(
                           color: Theme.of (context).primaryColor,
                           fontWeight: FontWeight.bold, fontSize: 18,
                         ) ,),
                     ),// Text
                   ],
                 ),
                  SizedBox(
                    height: 10,
                  ),
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
                        Navigator.pushNamed(context, 'home');
                      },
                      child: Text("Login"),
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 18,
                        ), // TextStyle
                      ),
                      GestureDetector(
                        onTap: () {Navigator.pushNamed(context, 'register');},
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Theme.of (context).primaryColor,
                            fontWeight: FontWeight.bold, fontSize: 18,
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












//