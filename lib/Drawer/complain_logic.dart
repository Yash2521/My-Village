import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Complain_Logic {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void RaiseComplain() {
    TextEditingController complaint_title = TextEditingController();
    TextEditingController complaint_description = TextEditingController();
    String datetime = DateTime.now().toString();

    String title = complaint_title.text.trim();
    String description = complaint_description.text.trim();

    complaint_description.clear();
    complaint_title.clear();

    if (title != '' && description != '') {
      firestore
          .collection('village')
          .add({"title": title, "description": description  , "time" : datetime});
    }
  }


}