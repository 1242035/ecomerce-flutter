import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class GirliesProfile extends StatefulWidget {
  @override
  _GirliesProfileState createState() => _GirliesProfileState();
}

class _GirliesProfileState extends State<GirliesProfile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(translate("Profile")),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("My Profile"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
