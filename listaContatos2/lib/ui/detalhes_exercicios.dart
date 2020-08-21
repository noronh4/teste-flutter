import 'package:flutter/material.dart';

class DetalhesExercicios extends StatelessWidget {
  @override
  String title = "";

  DetalhesExercicios({Key key, @required this.title}) : super(key: key);

  //map pra enviar para o firebase
  //  title
  //  pesoController.text
  //  reptsController.text
  //  seriesController.text

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(60, 10, 60, 0),
            color: Colors.white,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso (kg)",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
            color: Colors.white,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Repts",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
            color: Colors.white,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Series",
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
