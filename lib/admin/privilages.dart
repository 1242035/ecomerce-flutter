import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Privilages extends StatefulWidget {
  @override
  _PrivilagesState createState() => _PrivilagesState();
}

class _PrivilagesState extends State<Privilages> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(translate("Privilages")),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("Privilages"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
