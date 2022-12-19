import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final number1='+919328044613';
  final number2='+919714193006';
  final number3='+916356637280';
  final number4='+919909043696';
  final number5='+916354215154';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
         child:Column(
           children: [
             SizedBox(
               height: 8,
             ),
             Container(
                 width: 200,
                 height: 60,
                 child: Image.asset('assest/contact.jpg')
             ),
             SizedBox(
               height: 30,
             ),
             Card(
               child: ListTile(
                 leading:Image(image: AssetImage('assest/hospital.png'),width: 50),
                 title: Text("Hospital"),
                 subtitle:Text("+919328044613"),
                 onTap: (){
                   FlutterPhoneDirectCaller.callNumber(number1);
                 },
               ),
             ),


              Card(
                child: ListTile(
                 leading:Image(image: AssetImage('assest/police.png'),width: 50),
                 title: Text("police"),
                 subtitle:Text("+919714193006"),
                 onTap: (){
                   FlutterPhoneDirectCaller.callNumber(number2);
                 },
             ),
              ),
             Card(
            child: ListTile(
               leading:Image(image: AssetImage('assest/fire.png'),width: 50),
               title: Text("Fire station"),
               subtitle:Text("+916356637280"),
               onTap: (){
                 FlutterPhoneDirectCaller.callNumber(number3);
               },
             ),),
             Card(
               child: ListTile(
                 leading:Image(image: AssetImage('assest/secretary.png'),width: 50),
                 title: Text("secretary"),
                 subtitle:Text("+919909043696"),
                 onTap: (){
                   FlutterPhoneDirectCaller.callNumber(number4);
                 },
               ),
             ),
             Card(
             child:ListTile(
               leading:Image(image: AssetImage('assest/sos.png'),width: 50),
               title: Text("SOS"),
               subtitle:Text("+916354215154"),
               onTap: (){
                 FlutterPhoneDirectCaller.callNumber(number5);
               },
             ),),
             ]
    ),
    ),
    );
  }
}
