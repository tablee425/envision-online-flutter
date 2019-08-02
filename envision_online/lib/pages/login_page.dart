import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:envision_online/components/top_logo_bar.dart';

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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _container(),
    );
  }

  Widget _container() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TopLogoBar(),
        ],
      )
    );
  }

  void _goHomePage() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
  }
}