import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter/material.dart';

class GirliesAboutUs extends StatefulWidget {
  @override
  _GirliesAboutUsState createState() => _GirliesAboutUsState();
}

class _GirliesAboutUsState extends State<GirliesAboutUs> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text( translate("About Us") ),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("About Viauco"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
