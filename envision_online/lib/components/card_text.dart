import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';

class CardText extends StatelessWidget {
  String title;
  CardText({this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      elevation: 3.0,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
        child: new Text(title, style: TextStyle(fontSize: 18.0)),
      ),
    );
  }
}
