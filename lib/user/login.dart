import 'package:flutter/material.dart';
import 'package:shop/base/app_methods.dart';
import 'package:shop/tools/app_tools.dart';
import 'package:shop/user/signup.dart';
import 'package:shop/repository/firebase_methods.dart';
import 'package:flutter_translate/flutter_translate.dart';

class GirliesLogin extends StatefulWidget {
  @override
  _GirliesLoginState createState() => _GirliesLoginState();
}

class _GirliesLoginState extends State<GirliesLogin> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethod = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text(translate("Login")),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: translate("Email Address"),
                textIcon: Icons.email,
                controller: email),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: translate("Password"),
                textIcon: Icons.lock,
                controller: password),
            appButton(
                btnTxt: translate("Login"),
                onBtnclicked: verifyLoggin,
                btnPadding: 20.0,
                btnColor: Theme.of(context).primaryColor),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new SignUp()));
              },
              child: new Text(
                translate("Not Registered? Sign Up Here"),
                style: new TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  verifyLoggin() async {
    if (email.text == "") {
      showSnackBar(
          translate('FieldCanNotEmpty', args: {"field": translate('Email')}),
          scaffoldKey);
      return;
    }

    if (password.text == "") {
      showSnackBar(
          translate('FieldCanNotEmpty', args: {"field": translate('Password')}),
          scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    appMethod
        .signIn(email.text.toLowerCase(), password.text.toLowerCase())
        .then((uid) {
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
    }).catchError((error) {
      closeProgressDialog(context);
      showSnackBar(error.details ?? error.toString(), scaffoldKey);
    });
  }
}
