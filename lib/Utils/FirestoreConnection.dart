import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

Future getHomePost() async {
  var fs = Firestore.instance;
  QuerySnapshot snap = await fs.collection("HomeData").getDocuments();
  return snap.documents;
}
