import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 40.0;
  double _heigth = 80.0;
  Color _color = Colors.pink;
  BorderRadius _borderRadius = BorderRadius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated COntainer'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _changeContainer(),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeInCubic,
          duration: Duration(milliseconds: 500),
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
    );
  }

  void _changeContainer() {
    final width = Random().nextInt(500).toDouble();
    final height = Random().nextInt(500).toDouble();
    //final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    final color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    );
    final borderRadius = BorderRadius.circular(
      Random().nextInt(500).toDouble(),
    );
    if (mounted) {
      setState(() {
        _width = width;
        _heigth = height;
        _color = color;
        _borderRadius = borderRadius;
      });
    }
  }
}
