import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class GirliesCart extends StatefulWidget {
  @override
  _GirliesCartState createState() => _GirliesCartState();
}

class _GirliesCartState extends State<GirliesCart> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text( translate("Cart") ),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("My Cart"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
