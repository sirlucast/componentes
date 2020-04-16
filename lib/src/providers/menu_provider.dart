import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  // _MenuProvider() {
  //   cargarData();
  // }

  // mejor es resolver la carga y decode del json con un Future
  Future<List<dynamic>> cargarData() async {
    // se espera a se cargue el json
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap["rutas"];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
