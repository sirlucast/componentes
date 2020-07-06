import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List _listaNumeros = [1, 3, 5, 7, 6, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas y Scroll"),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {
        final int image = _listaNumeros[index];
        return FadeInImage.assetNetwork(
          placeholder: "assets/original.gif",
          image: "https://picsum.photos/800/300?random=$image",
        );
      },
    );
  }
}
