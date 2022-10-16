import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _NewsPageState();
  String inkwell='';
}

class _NewsPageState extends State<NewsPage> {
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
                  child: Image.asset('assest/news2.jpg',
                  fit: BoxFit.fitWidth,)

              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // setState(() {
                      //   // state will be set when the inkwell area is tapped
                      //   inkwell='Inkwell Tapped';
                     // });
                    },
                    child: Container(
                      width: 350,
                      height: 170,
                      margin: EdgeInsets.fromLTRB(20.0, 45.0, 0.0, 0.0),
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage('assest/news.jpg'),
                            fit: BoxFit.fitWidth,)
                      ),
                    ),

                  ),

                ],
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'login');
                  print("hii");
                },
                child: Image(image: AssetImage('assest/news.jpg')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
