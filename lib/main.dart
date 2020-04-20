import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // Como son pocas rutas, pasa. Pero idealmente hay que trabajar con
      // archivos de rutas independientes.
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) => HomePage(),
      //   'alert': (BuildContext context) => AlertPage(),
      //   'avatar': (BuildContext context) => AvatarPage(),
      // },
      //
      //Archivo con rutas:
      routes: getApplicationRoutes(),
      // Cuando se llama a una ruta con nombre que no existe:
      onGenerateRoute: (settings) {
        print('pasa por esta ruta: "${settings.name}"');
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        );
      },
    );
  }
}
