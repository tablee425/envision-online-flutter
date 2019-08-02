import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/primary_button.dart';
import 'package:envision_online/utils/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final globalKey = new GlobalKey<ScaffoldState>();

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
          PrimaryButton(title: 'Login', callback: () { _onLogin(); }),
        ],
      )
    );
  }

  void _goHomePage() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
  }

  void _onLogin() {
    print('login...');
  }
}