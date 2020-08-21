import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listaContatos2/ui/home_page.dart';
//import 'package:ficha-treino/lib/ui/home_page.dart';

void main() async {
  runApp(MaterialApp(
    home: HomePage(),
  ));
  // importante
  //d.reference.updateData({'true': true});

//  DocumentSnapshot snapshot2 = await Firestore.instance
//      .collection('grupo-muscular')
//      .document(('ombro'))
//      .get();
//      print(snapshot2.data);
}
