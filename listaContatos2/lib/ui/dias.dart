import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listaContatos2/ui/grupos_musculares.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  @override
  List<String> nomesDays = [
    "Segunda",
    "Terca",
    "Quarta",
    "Quinta",
    "Sexta",
    "Sabado"
  ];
  Widget buildTileList2(String title) {
    return ListTile(
      title: Text(
        title,
      ),
      trailing: Icon(Icons.add),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GruposMusculares()),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha de Treino'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildTileList2(nomesDays[0]),
            buildTileList2(nomesDays[1]),
            buildTileList2(nomesDays[2]),
            buildTileList2(nomesDays[3]),
            buildTileList2(nomesDays[4]),
            buildTileList2(nomesDays[5]),
          ],
        ),
      ),
    );
  }
}
