import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:flutter/cupertino.dart';

class PiggingPage extends StatefulWidget {
  final selected_areaname;

  PiggingPage({
    Key key,
    @required this.selected_areaname
  }) : super(key: key);

  @override
  _PiggingPageState createState() => _PiggingPageState();
}

class _PiggingPageState extends State<PiggingPage> {
  final globalKey = new GlobalKey<ScaffoldState>();
  String selected_areaname;

  @override
  void initState() {
    super.initState();
    selected_areaname = widget.selected_areaname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: cAppPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Fields', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        backgroundColor: cAppPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        brightness: Brightness.light,
      ),
      body: new SafeArea(
        child: new Stack(
          children: <Widget>[
            _container(),
          ],
        ),
      ),
    );
  }

  Widget _container() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: cAppPrimaryColor,
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TopLogoBar(),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text('Location: ' + selected_areaname, style: TextStyle(color: Colors.green, fontSize: 20.0)),
              ],
            ),
          ],
        )

    );
  }

  void _onNext() {

  }
}
