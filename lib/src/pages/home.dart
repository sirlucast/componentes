import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

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
    // como el menu provider retorna un Future, entonces se puede usar un Then.
    // menuProvider.cargarData().then((opciones) {
    // hacer esto puede traer algunos "problemas", la app se veria "trabada"
    // mientras se espera la respuesta del then, para evitarlo se usará un
    // Future builder.
    //   print(opciones);
    // });

    // ya no es necesario este return porque se cambia por el Future builder
    // return ListView(
    //   children: _crearLista(),
    // );

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _crearLista(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _crearLista(data, BuildContext context) {
    final List<Widget> opciones = [];
    for (var item in data) {
      final _tempWidget = ListTile(
        title: Text(item["texto"]),
        leading: geticon(item["icon"]),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          // Ejemplo navegacion "simple":
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => AlertPage(),
          //   ),
          // );
          //
          //Navgacion con rutas con nombre:
          Navigator.pushNamed(context, item['ruta']);
        },
      );

      opciones
        ..add(_tempWidget)
        ..add(
          Divider(
            height: 5,
            color: Colors.red,
          ),
        );
    }
    return opciones;
  }
}
