import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AppOrders extends StatefulWidget {
  @override
  _AppOrdersState createState() => _AppOrdersState();
}

class _AppOrdersState extends State<AppOrders> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text( translate("App Orders") ),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("App Orders"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
