import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert pages'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backspace),
        onPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("disparar alerta"),
          onPressed: () => _mostrarAlerta(context),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es  lcontenido de la caaj de alerta'),
              FlutterLogo(size: 100),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
