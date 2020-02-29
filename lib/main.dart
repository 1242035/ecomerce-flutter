import 'package:flutter/material.dart';
import 'user/app_main.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Girlies',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new AppMain(),
    );
  }
}
