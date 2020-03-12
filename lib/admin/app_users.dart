import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AppUsers extends StatefulWidget {
  @override
  _AppUsersState createState() => _AppUsersState();
}

class _AppUsersState extends State<AppUsers> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(translate("App Users")),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("App Users"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
