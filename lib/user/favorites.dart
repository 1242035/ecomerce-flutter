import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class GirliesFavorities extends StatefulWidget {
  @override
  _GirliesFavoritiesState createState() => _GirliesFavoritiesState();
}

class _GirliesFavoritiesState extends State<GirliesFavorities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text( translate("My Favorites") ),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          translate("My Favorites"),
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
