import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'splash_page.dart';
import 'area_page.dart';
import 'package:envision_online/utils/app_shared_preferences.dart';
import 'package:envision_online/components/progress_dialog.dart';
import 'package:envision_online/utils/constants.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/card_button.dart';
import 'package:envision_online/components/card_text.dart';
import 'package:envision_online/models/User.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final globalKey = new GlobalKey<ScaffoldState>();
  ProgressDialog progressDialog = ProgressDialog.getProgressDialog(ProgressDialogTitles.FETCHING_AREA);
  User user;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (user == null) {
      await initUserProfile();
    }
  }

  Future<void> initUserProfile() async {
    User up = await AppSharedPreferences.getUserProfile();
    setState(() {
      user = up;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: cAppPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        backgroundColor: cAppPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
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
            CardText(title: 'Choose Option Below'),
            CardButton(title: 'Enter Pig Runs', callback: () { _onEnterPigRuns(); }),
            CardButton(title: 'Sync', callback: () { _onSync(); }),
            CardButton(title: 'Settings', callback: () { _onSettings(); }),
            new Expanded(
              child: new Container(
                margin: EdgeInsets.only(bottom: 0),
              ),
            ),
            CardButton(title: 'Logout', callback: () { _onLogout(); }),
            new Container(
              height: 10,
            ),
          ],
        )
    );
  }

  void _logout() {
    Navigator.of(globalKey.currentContext).pop();
    AppSharedPreferences.clear();
    Navigator.pushReplacement(globalKey.currentContext, new MaterialPageRoute(builder: (context) => new SplashPage()));
  }

  void _onEnterPigRuns() {
//    print(user.user_id);
    progressDialog.showProgress();
//    Navigator.push(globalKey.currentContext, new MaterialPageRoute(builder: (context) => new AreaPage()));
  }

  void _onSync() {

  }

  void _onSettings() {

  }

  void _onLogout() {
    showDialog(context: globalKey.currentContext, barrierDismissible: false, child: _logoutDialog());
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
