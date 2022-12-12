import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Events/navratri.dart';
import 'package:practice/newpassword.dart';
import 'package:practice/newsdetail.dart';
import 'package:practice/register.dart';
import 'package:practice/splash.dart';
import 'package:practice/theme_model.dart';
import 'package:practice/update.dart';
import 'package:practice/uploadphoto.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(_)=>ThemeModel(),
        child : Consumer (builder: (context, ThemeModel themeModal, child){
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      home:
      AnimatedSplashScreen(splash:
        Image.asset('assest/homelogo.jpg',
          height: 500,
          width: 500,
        ),
        backgroundColor: Colors.black,
        duration: 2500,
        nextScreen:MyLogin(),
        ),

    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home': (context) => MyHome(),
      'event1':(context) => ED(),
      'news1':(context) => ND(),
      'newpassword':(context)=>NewPassword(),
      'update' :(context)=>UploadPhoto(),
    },

    theme: themeModal.isDark? ThemeData.dark(): ThemeData.light()
    );
        }
        )
    );
  }
}