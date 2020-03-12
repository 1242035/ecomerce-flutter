import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AppMessages extends StatefulWidget {
  @override
  _AppMessagesState createState() => _AppMessagesState();
}

class _AppMessagesState extends State<AppMessages> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(translate("App Messages")),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("App Messages"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
