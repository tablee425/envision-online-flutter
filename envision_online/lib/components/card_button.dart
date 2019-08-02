import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';

class CardButton extends StatelessWidget {
  String title;
  VoidCallback callback;
  CardButton({this.title, this.callback});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      elevation: 3.0,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
        child: new SizedBox(
          width: double.infinity,
          height: 40.0,
          child: new OutlineButton(
            onPressed: () { _onLogin(); },
            child: new Text(title, style: TextStyle(fontSize: 17.0, color: cAppButtonBorderColor)),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
            borderSide: BorderSide(color: cAppButtonBorderColor),
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    callback();
  }
}
