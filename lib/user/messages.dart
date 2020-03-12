import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class GirliesMessages extends StatefulWidget {
  @override
  _GirliesMessagesState createState() => _GirliesMessagesState();
}

class _GirliesMessagesState extends State<GirliesMessages> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(translate("Messages")),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("My Messages"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
