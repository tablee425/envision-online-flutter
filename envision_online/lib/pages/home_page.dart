import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        backgroundColor: cAppPrimaryColor,
        elevation: 0,
      ),
    );
  }
}