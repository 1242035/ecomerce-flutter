import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class GirliesNotifications extends StatefulWidget {
  @override
  _GirliesNotificationsState createState() => _GirliesNotificationsState();
}

class _GirliesNotificationsState extends State<GirliesNotifications> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(translate("Order Notifications")),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("My Notfications"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
