import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.00;
  bool _checkBoxChequed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Pages'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      onChanged: (value) {
        setState(() {
          _valorSlider = _checkBoxChequed ? value : _valorSlider;
        });
      },
      value: _valorSlider,
      min: 10.00,
      max: 400.00,
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
    );
  }

  Widget _crearImagen() {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/original.gif',
      image: 'https://pngimage.net/wp-content/uploads/2018/05/batman-png.png',
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    return Checkbox(
      onChanged: (bool value) {
        setState(() {
          _checkBoxChequed = value;
        });
      },
      value: _checkBoxChequed,
    );
  }
}
