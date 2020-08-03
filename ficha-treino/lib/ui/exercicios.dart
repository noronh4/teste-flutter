import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercicos {
  @override
  String nome;
  int weight;
  int repet;
  int sets;

  Exercicos(this.nome, this.weight, this.repet, this.sets);
}

//Widget lista(List exercicio) {}

class ListaTreinos extends StatefulWidget {
  @override
  _ListaTreinosState createState() => _ListaTreinosState();
}

List<dynamic> exerciciosCostas = [
  Exercicos('Remada alta', 10, 12, 3),
  Exercicos("Puxada alta", 50, 12, 3),
  Exercicos("Superman", 10, 12, 3)
];

class _ListaTreinosState extends State<ListaTreinos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Costas"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: exerciciosCostas.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                  //margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                  margin: EdgeInsets.only(left: 20),
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 180,
                        child: Text(
                          "${exerciciosCostas[index].nome}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Peso: ${exerciciosCostas[index].weight}",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text("Repeticoes: ${exerciciosCostas[index].repet}",
                                style: TextStyle(fontSize: 18)),
                            Text("Series: ${exerciciosCostas[index].sets}",
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
