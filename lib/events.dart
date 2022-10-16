import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatefulWidget {

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              child: Image.asset('assest/event.png')

            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'event1');
                  },
                  child: Container(
                    width: 370,
                    height: 168,
                    margin: EdgeInsets.fromLTRB(12.0, 45.0, 0.0, 0.0),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage('assest/navratri.jpeg'),
                        fit: BoxFit.fitWidth,)
                      ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'event1');
                  },
                  child: Container(
                    width: 370,
                    height: 168,
                    margin: EdgeInsets.fromLTRB(12.0, 45.0, 0.0, 0.0),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage('assest/diwali.jpg'),
                          fit: BoxFit.fitWidth,)
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'event1');
                  },
                  child: Container(
                    width: 370,
                    height: 168,
                    margin: EdgeInsets.fromLTRB(12.0, 45.0, 0.0, 0.0),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage('assest/holi.jpg'),
                          fit: BoxFit.fitWidth,)
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'event1');
                  },
                  child: Container(
                    width: 370,
                    height: 168,
                    margin: EdgeInsets.fromLTRB(12.0, 45.0, 0.0, 0.0),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage('assest/dushera.jpg'),
                          fit: BoxFit.fitWidth,)
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

