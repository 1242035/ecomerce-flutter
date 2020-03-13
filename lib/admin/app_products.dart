import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AppProducts extends StatefulWidget {
  @override
  _AppProductsState createState() => _AppProductsState();
}

class _AppProductsState extends State<AppProducts> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text( translate("App Products") ),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("App Products"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
