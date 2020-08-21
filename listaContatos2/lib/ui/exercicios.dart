import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listaContatos2/ui/detalhes_exercicios.dart';

List<String> nomesGruposMusculares = [
  "Costas",
  "Ombros",
  "Peito",
  "Bracos",
  "Abdomen",
  "Pernas"
];

List<String> nomesDays = [
  "Segunda",
  "Terca",
  "Quarta",
  "Quinta",
  "Sexta",
  "Sabado"
];

final db = Firestore.instance;
readData(String grupoMuscular) async {
  //DocumentReference documentReference =
  //    Firestore.instance.collection("Costas").document("Puxada alta");
//
  //documentReference.get().then((datasnapshot) {
  //  print(datasnapshot.data["peso"]);
  //  print(datasnapshot.data["repeticoes"]);
  //  print(datasnapshot.data["series"]);

  QuerySnapshot snapshot = await db
      .collection('gruposMusculares')
      .document('Peito')
      .collection('exercicios')
      .getDocuments();
  snapshot.documents.forEach((element) {
    print(element.data);
    print(element.documentID);
  });

  QuerySnapshot snapshot2 =
      await Firestore.instance.collection('grupoMuscular').getDocuments();
  snapshot2.documents.forEach((d) {
    //print(d.data.runtimeType);
    print(d.documentID); //pegar os nomes dos exercicios
    print(d.data['repeticoes']);
  });
}

List<String> nomesExercicios = [];
Future getNomesExercicios(String grupoMuscular) async {
  nomesExercicios = [];
  QuerySnapshot snapshot = await db
      .collection('gruposMusculares')
      .document(grupoMuscular)
      .collection('exercicios')
      .getDocuments();
  //nomesExercicios = snapshot.documents.toList();

  snapshot.documents.forEach((element) {
    nomesExercicios.add(element.documentID);
    //nomesExercicios.add(element.documentID);
    //print(element.documentID);
    //nomesExercicios.add(element.documentID);
    //print(element.documentID);
    //return element.documentID;
  });
  //return nomesExercicios;
  //print(nomesExercicios);
  //return snapshot.documents;
}

class Exercicios extends StatelessWidget {
  String title = "";

  Exercicios({Key key, @required this.title}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: getNomesExercicios(this.title),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return new Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: nomesExercicios.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(nomesExercicios[index]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetalhesExercicios(
                                        title: nomesExercicios[index],
                                      )),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}
