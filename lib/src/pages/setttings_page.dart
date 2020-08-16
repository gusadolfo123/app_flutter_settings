import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:user_settings/src/share_prefs/preferences_user.dart';
import 'package:user_settings/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecondary;
  int _genre;
  String _nombre;
  TextEditingController _textController;
  final _prefs = PreferencesUser();

  @override
  void initState() {
    super.initState();
    _prefs.lastPage = SettingsPage.routeName;
    _genre = _prefs.genre;
    _colorSecondary = _prefs.colorSecondary;
    _nombre = _prefs.name;
    _textController = TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecondary,
            title: Text("Color Secundario"),
            onChanged: (value) {
              setState(() {
                _prefs.colorSecondary = _colorSecondary = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _genre,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _genre,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre usuaro telefono",
              ),
              onChanged: (value) {
                _prefs.name = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedRadio(int value) {
    _prefs.genre = value;
    _genre = value;
    setState(() {});
  }
}
