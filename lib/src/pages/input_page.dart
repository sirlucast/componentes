import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  List<String> _poderes = ['volar', 'super fuerza', 'rayos x'];
  String _poderSeleccionado =
      'volar'; // s le asigno un valorr uqe ya existe en _poderes

  //controlador de campo de texto de fecha
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        children: <Widget>[
          _crearinput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(context),
          Divider(),
          _crearPersona(),
          Divider(),
        ],
      ),
    );
  }

  Widget _crearinput() {
    return TextField(
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        counter: Text('Letras ${_nombre.length}'),
        labelText: 'Nombre',
        hintText: 'nombre de la persona',
        suffixIcon: Icon(Icons.accessibility),
        prefixIcon: Icon(Icons.person),
        icon: Icon(Icons.account_box),
      ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        labelText: 'Email',
        hintText: 'email de la persona',
        suffixIcon: Icon(Icons.accessibility),
        prefixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre ingresado es: $_nombre'),
      subtitle: Text('Email: $_email - Psw: $_password'),
      trailing: Text('Poder: $_poderSeleccionado'),
    );
  }

  Widget _crearPassword() {
    return TextField(
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        labelText: 'Password',
        hintText: 'password de la persona',
        suffixIcon: Icon(Icons.visibility),
        icon: Icon(Icons.lock_outline),
      ),
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      // se asigna el controlador de fecha al textField
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      onTap: () {
        // se quita el foco al hacer tap.
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        labelText: 'Fecha de nacimiento',
        hintText: 'fecha de nacimiento',
        suffixIcon: Icon(Icons.person),
        icon: Icon(Icons.calendar_today),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: new DateTime(1990, 01, 01),
      lastDate: new DateTime.now(),
      locale: Locale('es', 'LA'),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(
        DropdownMenuItem(
          child: Text(poder),
          value: poder,
        ),
      );
    });
    return lista;
  }

  Widget _crearDropdown(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 25),
        Expanded(
          child: DropdownButton(
            value: _poderSeleccionado, // Valor actual de la opcion seleccionada
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              print(opt);
              setState(() {
                _poderSeleccionado = opt;
              });
            },
          ),
        ),
      ],
    );
  }
}
