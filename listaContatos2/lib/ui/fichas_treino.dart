import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:listaContatos2/ui/dias.dart';
import 'package:listaContatos2/ui/exercicios.dart';

class FichaTreino extends StatefulWidget {
  @override
  _FichaTreinoState createState() => _FichaTreinoState();
}

class _FichaTreinoState extends State<FichaTreino> {
  //CalendarController _controller;
  //DateTime pickedDate;

  DateTime selectedDate;
  DateTime selectedDate2;
  String dataInicio = '';
  String dataFim = '';

  final dateFormat = new DateFormat('dd-MM-yyyy');
  String formatted;

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Criar ficha de treino"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: TextField(
                  decoration: InputDecoration(hintText: "Nome da ficha"),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: TextField(
                decoration: InputDecoration(hintText: "Professor"),
              ),
            ),
            ListTile(
              title: Text("Data de inicio: "),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                final selectedDate = await _selectDateTime(context);
                if (selectedDate != null && selectedDate != dataInicio) {
                  setState(() {
                    dataInicio = dateFormat
                        .format(selectedDate)
                        .toString()
                        .replaceAll('-', '/');
                  });
                }
              },
              subtitle: Text("$dataInicio"),
            ),
            ListTile(
              title: Text("Validade da ficha:"),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                final selectedDate2 = await _selectDateTime(context);
                if (selectedDate2 != null && selectedDate2 != dataFim) {
                  setState(() {
                    dataFim = dateFormat
                        .format(selectedDate2)
                        .toString()
                        .replaceAll('-', '/');
                  });
                }
              },
              subtitle: Text("$dataFim"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //readData(nomesDays[0]);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Days()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
