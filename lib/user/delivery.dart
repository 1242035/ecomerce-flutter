import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class GirliesDelivery extends StatefulWidget {
  @override
  _GirliesDeliveryState createState() => _GirliesDeliveryState();
}

class _GirliesDeliveryState extends State<GirliesDelivery> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(translate("Delivery Information")),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("My Address"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
