import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        children: <Widget>[
          _cardTipo1(),
          _cardTipo2(),
        ],
        padding: EdgeInsets.all(15),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 25,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Titulo de esta targeta'),
            subtitle: Text(
                'Subtitulo de un list tile utilizado de ejemplo, para mostrar ' +
                    'como se ordena el texto al usarse dntro de un column en ' +
                    'un card. '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text('asdfs'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: 'assets/original.gif',
            image: 'https://wallpaperaccess.com/full/959294.jpg',
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
            height: 250,
          ),
          ListTile(
            title: Text('titulo del list tile'),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
