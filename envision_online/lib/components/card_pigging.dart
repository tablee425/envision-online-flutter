import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';

class CardPigging extends StatelessWidget {
  String piggingId;
  String startLocation;
  String endLocation;
  String orderId;
  VoidCallback callback;
  CardPigging({this.piggingId, this.startLocation, this.endLocation, this.orderId, this.callback});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 3.0,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () { _onLogin(); },
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 20.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Pigging ID'),
                    Text(piggingId),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Start Location'),
                    Text(startLocation),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('End Location'),
                    Text(endLocation),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 5.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Order'),
                    Text(orderId),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    callback();
  }
}
