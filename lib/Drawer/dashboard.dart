import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:practice/language_constants.dart';

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
              translation(context).email,
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
                      Center(
                        child: Text(
                          "Name",
                          textScaleFactor: 1.5,
                        ),
                      ),
                      Text("Vijay",
                          textScaleFactor: 1.5, textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Center(child: Text("Phone No.", textScaleFactor: 1.5)),
                      Text("9879879987",
                          textScaleFactor: 1.5, textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Center(child: Text("Family Members", textScaleFactor: 1.5)),
                      Text("5",
                          textScaleFactor: 1.5, textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Center(child: Text("Address", textScaleFactor: 1.5)),
                      Text("Varachha",
                          textScaleFactor: 1.5, textAlign: TextAlign.center),
                    ])
                  ]))
        ]),
      ),
    ));
  }
}
