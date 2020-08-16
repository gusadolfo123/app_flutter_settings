import 'package:flutter/material.dart';
import 'package:user_settings/src/pages/home_page.dart';
import 'package:user_settings/src/pages/setttings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image1.jpg"), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomaPage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text("Pages"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              // Navigator.pop(context, SettingsPage.routeName);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          )
        ],
      ),
    );
  }
}
