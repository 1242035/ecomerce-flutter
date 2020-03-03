import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop/admin/admin_home.dart';
import 'package:shop/tools/store.dart';
import 'package:shop/tools/app_data.dart';
import 'package:shop/tools/app_methods.dart';
import 'package:shop/tools/app_tools.dart';
import 'package:shop/tools/firebase_methods.dart';
import 'package:shop/user/item_details.dart';
import 'favorites.dart';
import 'messages.dart';
import 'cart.dart';
import 'notifications.dart';
import 'history.dart';
import 'profile.dart';
import 'delivery.dart';
import 'login.dart';

class AppMain extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppMain> {
  BuildContext context;
  FirebaseUser user;
  String acctName = "";
  String acctEmail = "";
  String acctPhotoURL = "";
  bool isLoggedIn;
  AppMethods appMethods = new FirebaseMethods();

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser() async {
    user = await appMethods.getCurrentUser();
    acctName = user.displayName;
    acctEmail = user.email;
    acctPhotoURL = user.photoUrl;
    isLoggedIn = user != null && user.uid != null ? true : false;
    acctName = acctName == null ? "Guest" : acctName;
    acctEmail = acctEmail == null ?  "guest@email.com" : acctEmail;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Scaffold(
      appBar: new AppBar(
        title: GestureDetector(
          onLongPress: openAdmin,
          child: new Text("Girlies"),
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        new GirliesFavorities()));
              }),
          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            new GirliesMessages()));
                  }),
              new CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
                child: new Text(
                  "0",
                  style: new TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              )
            ],
          )
        ],
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Flexible(
                child: new GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: storeItems.length,
              itemBuilder: (BuildContext context, int index) {
                return new GestureDetector(
                  onTap: () {
                    /* Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new ItemDetails(
                              itemImage: storeItems[index].itemImage,
                              itemName: storeItems[index].itemName,
                              itemPrice: storeItems[index].itemPrice,
                              itemRating: storeItems[index].itemRating,
                            )));*/

                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new ItemDetail(
                              itemImage: storeItems[index].itemImage,
                              itemName: storeItems[index].itemName,
                              itemPrice: storeItems[index].itemPrice,
                              itemRating: storeItems[index].itemRating,
                            )));
                  },
                  child: new Card(
                    child: Stack(
                      alignment: FractionalOffset.topLeft,
                      children: <Widget>[
                        new Stack(
                          alignment: FractionalOffset.bottomCenter,
                          children: <Widget>[
                            new Container(
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: new NetworkImage(
                                          storeItems[index].itemImage))),
                            ),
                            new Container(
                              height: 35.0,
                              color: Colors.black.withAlpha(100),
                              child: new Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Text(
                                      "${storeItems[index].itemName.substring(0, 8)}...",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0,
                                          color: Colors.white),
                                    ),
                                    new Text(
                                      "N${storeItems[index].itemPrice}",
                                      style: new TextStyle(
                                          color: Colors.red[500],
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              height: 30.0,
                              width: 60.0,
                              decoration: new BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: new BorderRadius.only(
                                    topRight: new Radius.circular(5.0),
                                    bottomRight: new Radius.circular(5.0),
                                  )),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),
                                  new Text(
                                    "${storeItems[index].itemRating}",
                                    style: new TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            new IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.blue,
                                ),
                                onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (BuildContext context) => new GirliesCart()));
            },
            child: new Icon(Icons.shopping_cart),
          ),
          new CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: new Text(
              "0",
              style: new TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          )
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(acctName),
              accountEmail: new Text(acctEmail),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Icon(Icons.person),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Order Notifications"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        new GirliesNotifications()));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Order History"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new GirliesHistory()));
              },
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Profile Settings"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new GirliesProfile()));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Delivery Address"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new GirliesDelivery()));
              },
            ),
            new Divider(),
            /*new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("About Us"),
              onTap: () {
                Navigator.of(context).push(new CupertinoPageRoute(
                    builder: (BuildContext context) => new GirliesAboutUs()));
              },
              //
            ),*/
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text(isLoggedIn == true ? "Logout" : "Login"),
              onTap: checkIfLoggedIn,
            ),
          ],
        ),
      ),
    );
  }

  checkIfLoggedIn() async {
    if (isLoggedIn == false) {
      bool response = await Navigator.of(context).push(new CupertinoPageRoute(
          builder: (BuildContext context) => new GirliesLogin()));
      if (response == true) getCurrentUser();
      return;
    }
    appMethods.signOut()
    .then( (res) {
      getCurrentUser();
    })
    .catchError( (error) => print(error));
  }

  openAdmin() {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new AdminHome()));
  }
}
