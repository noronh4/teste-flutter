import 'package:flutter/material.dart';
import 'package:listaContatos2/helpers/contact_help.dart';
import 'package:listaContatos2/ui/fichas_treino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FichaTreino()),
            );
          },
          child: Text("Adicionar ficha de treino :p"),
        ),
      ),
    );
  }
}
