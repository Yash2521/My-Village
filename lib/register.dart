import 'package:flutter/material.dart';

class MyRegister extends StatelessWidget {
  @override
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
                Icon(Icons.person_outlined,color: Theme.of(context).primaryColor,size: 90,),
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
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person_outlined),
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
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone_android),
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
                    obscureText: true,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outline_rounded),
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
                        labelText:"Confirm password",
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
                    Navigator.pushNamed(context, 'home');
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
                        fontSize: 18,
                      ), // TextStyle
                    ),
                    GestureDetector(
                      onTap: () {Navigator.pushNamed(context, 'login');},
                      child: Text(
                        "Login",
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
    );
  }
}

