import 'package:flutter/material.dart';
import 'main.dart';
import 'language_constants.dart';

class language extends StatefulWidget {
  const language({Key? key}) : super(key: key);

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {

   late String valueChoose;
  List listItem = [
    "English", "Hindi"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Village Management System"),
      ),
      body: Center(
        child: DropdownButton(
          hint: Text("Select language"),
          dropdownColor: Colors.grey,
          icon: Icon(Icons.arrow_drop_down),
          iconSize:30,
          value: valueChoose,
          onChanged: (newValue){
            setState(() {
              //valueChoose = newValue;
            });
          },
          items: listItem.map((valueItem) {
            return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }
}
