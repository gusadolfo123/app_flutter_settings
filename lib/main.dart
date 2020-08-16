import 'package:flutter/material.dart';
import 'package:user_settings/src/pages/home_page.dart';
import 'package:user_settings/src/pages/setttings_page.dart';
import 'package:user_settings/src/share_prefs/preferences_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferencesUser();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      initialRoute: prefs.lastPage,
      routes: {
        HomaPage.routeName: (BuildContext context) => HomaPage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
