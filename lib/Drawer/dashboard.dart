import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome",
              textScaleFactor: 2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(

                  //textDirection: TextDirection.rtl,

                  defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                  border: TableBorder.all(width: 2.0, color: Colors.black),
                  children: [
                    TableRow(children: [
                      Text(
                        "Name",
                        textScaleFactor: 1.5,
                      ),
                      Text("ABC",
                          textScaleFactor: 1.5, textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Text("PhoneNo.", textScaleFactor: 1.5),
                      Text("9879879987",
                          textScaleFactor: 1.5, textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Text("Family Members", textScaleFactor: 1.5),
                      Text("00",
                          textScaleFactor: 1.5, textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Text("Address", textScaleFactor: 1.5),
                      Text("-",
                          textScaleFactor: 1.5, textAlign: TextAlign.center),
                    ])
                  ]))
        ]),
      ),
    ));
  }
}
