import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/card_button.dart';
import 'package:envision_online/components/card_input.dart';
import 'package:envision_online/utils/colors.dart';
import 'package:envision_online/utils/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final globalKey = new GlobalKey<ScaffoldState>();

  CardInput _emailInput = new CardInput(inputType: InputTypes.Email, callback: (t) { _onUpdateEmail(t); });
  CardInput _passwordInput = new CardInput(inputType: InputTypes.Password, callback: (t) { _onUpdatePassword(t); });

  String email;
  String password;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Please Login', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        backgroundColor: cAppPrimaryColor,
        elevation: 0,
      ),
      body: _container(),
    );
  }

  Widget _container() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: cAppPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TopLogoBar(),
          _emailInput,
          _passwordInput,
          Padding(padding: EdgeInsets.only(top: 10.0)),
          CardButton(title: 'Login', callback: () { _onLogin(); }),
        ],
      )
    );
  }

  void _goHomePage() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
  }

  void _onLogin() {
    _emailInput.resetText();
    _passwordInput.resetText();
  }

  static void _onUpdateEmail(String text) {
    print('email...'+text);
  }

  static void _onUpdatePassword(String text) {
    print('password...'+text);
  }
}