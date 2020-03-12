import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(translate("Order History")),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("Order History"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
