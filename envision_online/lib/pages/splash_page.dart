import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'dart:async';
import 'package:envision_online/transitions/fade_route.dart';
import 'package:envision_online/utils/app_shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), _onFinishSplash);
    return new Scaffold(
      key: globalKey,
      body: _splashContainer(),
    );
  }

  Widget _splashContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: new Image(
        image: new AssetImage('assets/images/splash.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  void _onFinishSplash() async {
    bool isLoggedIn = await AppSharedPreferences.isUserLoggedIn();
    if (this.mounted) {
      setState(() {
        if (isLoggedIn != null && isLoggedIn) {
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new HomePage()));
        } else {
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new LoginPage()));
        }
      });
    }
  }
}