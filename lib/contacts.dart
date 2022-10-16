import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.grey),
      home: Material(

        child: SingleChildScrollView(
          child:Column(
            children: [
              SizedBox(
                height: 8,
              ),
              // Text("Events",
              //   style: TextStyle(
              //     fontSize: 40.0,
              //     fontWeight: FontWeight.bold,
              //     decoration: TextDecoration.underline,
              //     fontFamily: GoogleFonts.gemunuLibre().fontFamily,
              //   ),
              // ),
              Container(
                  width: 200,
                  height: 60,
                  child: Image.asset('assest/contact.jpg',
                    fit: BoxFit.fitWidth,)

              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'contact1');
                    },
                    child: Container(
                      width: 350,
                      height: 168,
                      margin: EdgeInsets.fromLTRB(20.0, 45.0, 0.0, 0.0),
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage('assest/ecc.jpg'),
                            fit: BoxFit.fitWidth,)
                      ),
                    ),

                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}






















//import 'package:flutter/material.dart';
//
// class ContactsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         extendBodyBehindAppBar: true,
//         backgroundColor: Colors.white10,
//         body:
//           Column(
//             children: <Widget>[
//               Container(
//                 height: 80,
//                 width: 400,
//                 color: Colors.grey[400],
//                 margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
//                 padding:const EdgeInsets.symmetric(horizontal: 150.0, vertical: 30.0) ,
//                 child: Text('Police:100'),
//
//               )
//             ],
//           )
//       ),
//     //   child: Center(
//     //     child: Text("Emergency Contacts Page"),
//     //   ),
//     );
//   }
// }