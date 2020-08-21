import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listaContatos2/ui/exercicios.dart';
import 'exercicios.dart';

List<String> nomesGruposMusculares = [
  "Costas",
  "Ombros",
  "Peito",
  "Bracos",
  "Abdomen",
  "Pernas"
];

class GruposMusculares extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Grupos Musculares'), backgroundColor: Colors.red),
        body: ListView.builder(
          itemCount: nomesGruposMusculares.length,
          itemBuilder: (context, index) {
            return Center(
              child: Card(
                color: Colors.red,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    //getNomesExercicios(nomesGruposMusculares[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Exercicios(
                                title: nomesGruposMusculares[index],
                              )),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    child: Center(
                      child: Text(
                        nomesGruposMusculares[index],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
