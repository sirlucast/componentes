import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  // Home page temporal para crear una lista de
  // opciones con dos metodos de ejemplo
  final _opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: _crearOpciones2()),
    );
  }

  List<Widget> _crearOpciones() {
    List<Widget> lista = new List<Widget>();
    for (String opt in _opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista.add(tempWidget);
      lista.add(
        Divider(
          height: 5,
          color: Colors.red,
        ),
      );
    }
    return lista;
  }

  List<Widget> _crearOpciones2() {
    List<Widget> lista = new List<Widget>();
    return _opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
          ),
          Divider(
            height: 5,
            color: Colors.red,
          ),
        ],
      );
    }).toList();
  }
}
