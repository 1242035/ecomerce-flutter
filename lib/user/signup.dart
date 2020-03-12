import 'package:flutter/material.dart';
import 'package:shop/base/app_methods.dart';
import 'package:shop/tools/app_tools.dart';
import 'package:shop/repository/firebase_methods.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController rePassword = new TextEditingController();
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
        title: new Text(translate("Sign Up")),
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
                textHint: translate("Full Name"),
                textIcon: Icons.person,
                controller: fullname),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: translate("Phone Number"),
                textIcon: Icons.phone,
                textType: TextInputType.number,
                controller: phoneNumber),
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
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: translate("Re-Password"),
                textIcon: Icons.lock,
                controller: rePassword),
            appButton(
                btnTxt: translate("Create Account"),
                onBtnclicked: verifyDetails,
                btnPadding: 20.0,
                btnColor: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  verifyDetails() async {
    if (fullname.text == "") {
      showSnackBar(
          translate('FieldCanNotEmpty',
              args: {"field": translate("Full name")}),
          scaffoldKey);
      return;
    }

    if (phoneNumber.text == "") {
      showSnackBar(
          translate('FieldCanNotEmpty', args: {"field": translate("Phone")}),
          scaffoldKey);
      return;
    }

    if (email.text == "") {
      showSnackBar(
          translate('FieldCanNotEmpty', args: {"field": translate("Email")}),
          scaffoldKey);
      return;
    }

    if (password.text == "") {
      showSnackBar(
          translate('FieldCanNotEmpty', args: {"field": translate("Password")}),
          scaffoldKey);
      return;
    }

    if (rePassword.text == "") {
      showSnackBar(
          translate('FieldCanNotEmpty',
              args: {"field": translate("Re-Password")}),
          scaffoldKey);
      return;
    }

    if (password.text != rePassword.text) {
      showSnackBar(translate("PasswordNotMatch"), scaffoldKey);
      return;
    }
    displayProgressDialog(context);
    appMethod
        .signUp(email.text.toLowerCase(), password.text.toLowerCase())
        .then((uid) {
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    }).catchError((error) {
      closeProgressDialog(context);
      showSnackBar(error.details ?? translate("Error"), scaffoldKey);
    });
  }
}
