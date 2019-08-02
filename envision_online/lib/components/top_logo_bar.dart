import 'package:flutter/material.dart';

class TopLogoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: Stack(
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/images/envisionlogoback.png'),
            height: 60,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/images/embarklogo.png'),
                height: 60,
                fit: BoxFit.cover,
              ),
              new Text('EnVision', style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      )
    );
  }
}