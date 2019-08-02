import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/card_button.dart';
import 'package:envision_online/components/card_input.dart';
import 'package:envision_online/utils/colors.dart';
import 'package:envision_online/utils/constants.dart';
import 'package:envision_online/components/progress_dialog.dart';
import 'package:envision_online/futures/app_futures.dart';
import 'package:envision_online/models/EventObject.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final globalKey = new GlobalKey<ScaffoldState>();

  CardInput _emailInput = new CardInput(inputType: InputTypes.Email);
  CardInput _passwordInput = new CardInput(inputType: InputTypes.Password);
  ProgressDialog progressDialog = ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  bool _isAuthFailed = false;

  @override
  void initState() {
    super.initState();
    _isAuthFailed = false;
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
      body: new Stack(
        children: <Widget>[
          _container(),
          progressDialog,
        ],
      )
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
          _authFailedContainer(),
          CardButton(title: 'Login', callback: () { _onLogin(); }),
        ],
      )
    );
  }

  Widget _authFailedContainer() {
    return _isAuthFailed ? Center(
      child: Text('Authentication Failed', style: TextStyle(color: Colors.redAccent, fontSize: 20.0)),
    ) : Center();
  }

  void _goHomePage() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
  }

  void _onLogin() {
    String email = _emailInput.getText();
    String password = _passwordInput.getText();
    if (email == '') {
      globalKey.currentState.showSnackBar(new SnackBar(duration: const Duration(seconds: 1), content: new Text(SnackBarTexts.ENTER_EMAIL)));
      return;
    }
    if (password == '') {
      globalKey.currentState.showSnackBar(new SnackBar(duration: const Duration(seconds: 1), content: new Text(SnackBarTexts.ENTER_PASS)));
      return;
    }
    progressDialog.showProgress();
    _loginUser(email, password, true);
  }

  void _loginUser(String email, String password, bool remember_me) async {
    EventObject eventObject = await loginUser(email, password, remember_me);
    switch(eventObject.id) {
      case EventConstants.LOGIN_USER_SUCCESSFUL:
        {
          setState(() {
            _emailInput.resetText();
            _passwordInput.resetText();
            progressDialog.hideProgress();
            _goHomePage();
            _isAuthFailed = false;
          });
        }
        break;
      case EventConstants.LOGIN_USER_UN_SUCCESSFUL:
        {
          setState(() {
            progressDialog.hideProgress();
            _isAuthFailed = true;
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            progressDialog.hideProgress();
            _isAuthFailed = true;
          });
        }
        break;
    }
  }
}