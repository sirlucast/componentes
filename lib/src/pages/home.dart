import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);
  final _opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    print(menuProvider.cargarData());
    return ListView(
      children: _crearLista(),
    );
  }

  List<Widget> _crearLista() {
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
