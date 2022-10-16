import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:practice/checknumber.dart';
import 'package:practice/eventdetail.dart';
import 'package:practice/forget.dart';
import 'package:practice/newpassword.dart';
import 'package:practice/newsdetail.dart';
import 'package:practice/register.dart';
import 'package:practice/update.dart';
import 'home.dart';
import 'login.dart';

void main()
{
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp ({Key? key}) : super(key: key);
  final MaterialColor primarySwatch = MaterialColor(0xff3957ed, <int, Color>{
    50: Color(0xff3957ed),
    100: Color(0xff3957ed),
    200: Color(0xff3957ed),
    300: Color(0xff3957ed),
    400: Color(0xff3957ed),
    500: Color(0xff3957ed),
    600: Color(0xff3957ed),
    700: Color(0xff3957ed),
    800: Color(0xff3957ed),
    900: Color(0xff3957ed),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:MyHome(),
      // AnimatedSplashScreen(splash:
      //   Image.asset('assest/homelogo.jpg',
      //
      //   ),
      //   backgroundColor: Colors.black,
      //   duration: 2500,
      //   nextScreen:MyLogin(),),

    routes: {
    'register': (context) => MyRegister(),
    'login': (context) => MyLogin(),
    'home': (context) => MyHome(),
      'event1':(context) => ED(),
      'news1':(context) => ND(),
      'forget':(context)=>ForgetPassword(),
      'checknumber':(context)=>CheckNumber(),
      'newpassword':(context)=>NewPassword(),
      'update' :(context)=>UpdatePage(),
    },

    theme: ThemeData(
    iconTheme: IconThemeData(color: Color(0xff3957ed)),
    inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    )),
    ),
      textTheme: TextTheme(
          headline4:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(
            color: Colors.grey.shade600,
          )),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      primaryColor: Color(0xff3957ed),
      primarySwatch: primarySwatch,
    ),

    );
  }
}