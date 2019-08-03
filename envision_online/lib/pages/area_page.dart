import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'splash_page.dart';
import 'package:envision_online/utils/app_shared_preferences.dart';
import 'package:envision_online/components/progress_dialog.dart';
import 'package:envision_online/utils/constants.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/card_button.dart';
import 'package:envision_online/components/card_text.dart';

class AreaPage extends StatefulWidget {
  @override
  _AreaPageState createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final globalKey = new GlobalKey<ScaffoldState>();
  ProgressDialog progressDialog = ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: cAppPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Area', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        backgroundColor: cAppPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        brightness: Brightness.light,
      ),
      body: new SafeArea(
          child: new Stack(
            children: <Widget>[
              _container(),
              progressDialog,
            ],
          )
      ),
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
            Padding(padding: EdgeInsets.only(top: 10.0)),
            CardText(title: 'Select Area'),
            CardButton(title: 'Next', callback: () { _onNext(); }),
          ],
        )
    );
  }

  void _logout() {
    Navigator.of(globalKey.currentContext).pop();
    AppSharedPreferences.clear();
    Navigator.pushReplacement(globalKey.currentContext, new MaterialPageRoute(builder: (context) => new SplashPage()));
  }

  void _onNext() {

  }

  Widget _logoutDialog() {
    return new AlertDialog(
      title: new Text('Logout'),
      content: new Text('Are you sure you want to logout from the app'),
      actions: <Widget>[
        new FlatButton(onPressed: () { _logout(); }, child: new Text('OK')),
        new FlatButton(onPressed: () { Navigator.of(globalKey.currentContext).pop(); }, child: new Text('Cancel')),
      ],
    );
  }
}
