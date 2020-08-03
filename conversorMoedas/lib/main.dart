import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert'; // ou package:convert/convert.dart

const request = "https://api.hgbrasil.com/finance";

void main() async {
  print(await getData());

  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Onde crio variaveis e funcoes

  double dolar;
  double euro;

  void _realChange(String text) {
    double real = double.parse(text);
    dolarController.text = (real * this.dolar).toStringAsFixed(2);
    euroController.text = (real * this.euro).toStringAsFixed(2);
  }

  void _dolarChange(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChange(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Onde construo o app com os widgets
    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text("\$ Conversor"),
          backgroundColor: Colors.amber[300],
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Text(
                      "Carregando Dados...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Erro ao carregar os dados",
                        style:
                            TextStyle(color: Colors.amber[300], fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    dolar =
                        snapshot.data['results']['currencies']['USD']['buy'];
                    euro = snapshot.data['results']['currencies']['EUR']['buy'];
                    return SingleChildScrollView(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            size: 150,
                            color: Colors.amber,
                          ),
                          buildTextField(
                              "Real", "R\$", realController, _realChange),
                          Divider(),
                          buildTextField(
                              "Dolar", "\$", dolarController, _dolarChange),
                          Divider(),
                          buildTextField(
                              "Euro", "€", euroController, _euroChange)
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}

// Connstruindo os TextFields
Widget buildTextField(
    String label, String prefix, TextEditingController x, Function y) {
  return TextField(
    controller: x,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber[300]),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(color: Colors.white),
    onChanged: y,
    keyboardType: TextInputType.number,
  );
}
