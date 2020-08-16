import 'package:flutter/material.dart';
import 'package:user_settings/src/share_prefs/preferences_user.dart';
import 'package:user_settings/src/widgets/menu_widget.dart';

class HomaPage extends StatelessWidget {
  static final String routeName = "home";

  @override
  Widget build(BuildContext context) {
    final prefs = PreferencesUser();
    prefs.lastPage = HomaPage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color Secundario ${prefs.colorSecondary}"),
          Divider(),
          Text("Genero ${prefs.genre}"),
          Divider(),
          Text("Nombre Usuario ${prefs.name}"),
          Divider(),
        ],
      ),
    );
  }
}
