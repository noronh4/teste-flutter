import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
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
  String data = '';
  String data2 = '';

  final dateFormat = new DateFormat('dd-MM-yyyy');
  String formatted;

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100));

  Widget buildListTile(String title) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/arm2.jpg'),
      ),
      title: Text(
        title,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListaTreinos(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Ficha de Treino"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: TextField(
                  decoration: InputDecoration(hintText: "Nome"),
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
                if (selectedDate != null && selectedDate != data) {
                  setState(() {
                    data = dateFormat
                        .format(selectedDate)
                        .toString()
                        .replaceAll('-', '/');
                  });
                }
              },
              subtitle: Text("$data"),
            ),
            ListTile(
              title: Text("Validade da ficha:"),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                final selectedDate2 = await _selectDateTime(context);
                if (selectedDate2 != null && selectedDate2 != data) {
                  setState(() {
                    data2 = dateFormat
                        .format(selectedDate2)
                        .toString()
                        .replaceAll('-', '/');
                  });
                }
              },
              subtitle: Text("$data2"),
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Grupos Musculares",
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                ),
                buildListTile('Costas'),
                buildListTile('Ombros'),
                buildListTile('Peito'),
                buildListTile('Bracos'),
                buildListTile('Abdomen'),
                buildListTile('Pernas')
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
